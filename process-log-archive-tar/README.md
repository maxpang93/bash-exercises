# process-log-archive-tar

Given a `archive.tar` file, which contains UUID named files without extension, and may be empty, convert non-empty files into `.log` files as a new tar.

Use `gen_tar.py` to generate `archive.tar` file, and `my-script.sh` to extract to temporary directory, file by file processing and compress to new tar file.
