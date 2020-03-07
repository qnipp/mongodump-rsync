# mongodump-rsync
Docker container to perform a mongodump and rsync to a backup server

## Usage

Use the following environment variables to configure the image to your needs:

Variable | Behaviour | Default
---------|-----------|--------
MONGO_URL | Sets the MongoDB URL to dump from | mongodb://localhost:27017
MONGO_DUMP_OPTIONS | Sets additional command line options for mongodump | (empty)
TARBZ2_PATH | Path, where the tar.bz2 file is built | /tmp
SSH_DIR | Directory, where the SSH configuration files will be found | /ssh
RSYNC_TARGET | Target for the rsync operation | backup:/var/lib/backup

At least, MONGO_URL and RSYNC_TARGET must be set to fit your case.

## SSH Options

Use the volume on /ssh to provide your SSH options, especially

File | Description
-----|------------
id_rsa | The private key, which is used for the SSH connection. The public key must be installed on the target server.
known_hosts | The target server should be listed in this file.
config | The SSH config file.

You can use the respective files from a real user's `.ssh` directory.

## License

MIT