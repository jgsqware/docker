#! /bin/bash

set -e

# Copy files from /usr/share/jenkins/ref into /var/jenkins_home
# So the initial JENKINS-HOME is set with expected content.
# Don't override, as this is just a reference setup, and use from UI
# can then change this, upgrade plugins, etc.
copy_reference_file() {
	f=${1%/}
	echo "$f" >> $COPY_REFERENCE_FILE_LOG
    rel=${f:23}
    dir=$(dirname ${f})
    echo " $f -> $rel" >> $COPY_REFERENCE_FILE_LOG
	if [[ ! -e /var/jenkins_home/${rel} ]]
	then
		echo "copy $rel to JENKINS_HOME" >> $COPY_REFERENCE_FILE_LOG
		mkdir -p /var/jenkins_home/${dir:23}
		cp -r /usr/share/jenkins/ref/${rel} /var/jenkins_home/${rel};
		# pin plugins on initial copy
		[[ ${rel} == plugins/*.jpi ]] && touch /var/jenkins_home/${rel}.pinned
	fi;
}
export -f copy_reference_file
echo "--- Copying files at $(date)" >> $COPY_REFERENCE_FILE_LOG
find /usr/share/jenkins/ref/ -type f -exec bash -c "copy_reference_file '{}'" \;

# if `docker run` first argument start with `--` the user is passing jenkins launcher arguments
if [[ $# -lt 1 ]] || [[ "$1" == "--"* ]]; then
   exec java $JAVA_OPTS -jar /usr/share/jenkins/jenkins.war $JENKINS_OPTS "$@"
fi

# First, make sure that cgroups are mounted correctly.
CGROUP=/sys/fs/cgroup

[ -d $CGROUP ] ||
  mkdir $CGROUP

mountpoint -q $CGROUP ||
  mount -n -t tmpfs -o uid=0,gid=0,mode=0755 cgroup $CGROUP || {
    echo "Could not make a tmpfs mount. Did you use -privileged?"
    exit 1
  }

# Mount the cgroup hierarchies exactly as they are in the parent system.
for SUBSYS in $(cut -d: -f2 /proc/1/cgroup)
do
  [ -d $CGROUP/$SUBSYS ] || mkdir $CGROUP/$SUBSYS
  mountpoint -q $CGROUP/$SUBSYS ||
    mount -n -t cgroup -o $SUBSYS cgroup $CGROUP/$SUBSYS
done

# Now, close extraneous file descriptors.
pushd /proc/self/fd
for FD in *
do
  case "$FD" in
  # Keep stdin/stdout/stderr
  [012])
    ;;
  # Nuke everything else
  *)
    eval exec "$FD>&-"
    ;;
  esac
done
popd

docker daemon &
# As argument is not jenkins, assume user want to run his own process, for sample a `bash` shell to explore this image
exec "$@"
