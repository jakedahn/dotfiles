#!/usr/bin/python

import argparse
import os
import os.path
import tempfile
import sys


def parse_options():
    parser = argparse.ArgumentParser()
    parser.add_argument('-p', '--passwords', required=True,
                        help='Text file of sensitive data (key/value)')
    parser.add_argument('-i', '--install-dir', default='~',
                        help='Directory into which dotfiles will be installed')
    parser.add_argument('--dry-run', default=False, action='store_true',
                        help='Skip file installation and leave staging dir')
    return parser.parse_args()


def read_password_file(filename):
    try:
        pfile = open(filename)
    except IOError:
        sys.exit('Failed to open password file')

    passwords = {}

    for line in pfile.readlines():

        try:
            (key, value) = line.split('=')
        except ValueError:
            continue

        # strip trailing newline
        passwords[key] = value[:-1]

    pfile.close()

    return passwords


def create_staging_dir():
    return tempfile.mkdtemp(prefix='dotfiles-')


def subdir_create_factory(topdir):
    def create_subdir(path, subdirname):
        try:
            subdir = os.path.join(topdir, path, subdirname)
            os.mkdir(os.path.normpath(subdir))
        except OSError, exc:
            if exc.errno == 17:
                # already exists
                pass
            else:
                raise

    return create_subdir


def _walk_dotfiles(topdir, file_callback, subdir_callback=None):
    for path, subdirnames, filenames in os.walk(topdir):

        rel_path = os.path.relpath(path, topdir)

        if subdir_callback is not None:
            map(lambda sd: subdir_callback(rel_path, sd), subdirnames)

        map(lambda filename: file_callback(rel_path, filename), filenames)


def stage_dotfiles(source_dir, staging_dir, passwords):

    def munge_file(path, filename):
        infile = os.path.join(source_dir, path, filename)
        outfile = os.path.join(staging_dir, path, filename)

        infile_obj = open(infile)
        outfile_obj = open(outfile, 'w')

        data = infile_obj.read()
        data = data % passwords
        outfile_obj.write(data)

        infile_obj.close()
        outfile_obj.close()

    subdir_callback = subdir_create_factory(staging_dir)

    _walk_dotfiles('dotfiles/', munge_file, subdir_callback)


def install_dotfiles(staging_dir, install_dir):

    def install_file(path, filename):
        infile = os.path.join(staging_dir, path, filename)
        outfile = os.path.join(install_dir, path, filename)
        infile_obj = open(infile)
        outfile_obj = open(outfile, 'w')
        outfile_obj.write(infile_obj.read())
        infile_obj.close()
        outfile_obj.close()

    subdir_callback = subdir_create_factory(install_dir)

    _walk_dotfiles(staging_dir, install_file, subdir_callback)


if __name__ == '__main__':
    options = parse_options()

    passwords = read_password_file(options.passwords)

    source_dir = 'dotfiles'
    staging_dir = create_staging_dir()
    stage_dotfiles(source_dir, staging_dir, passwords)

    if options.dry_run:
        print 'Success - dotfiles not installed'
    else:
        install_dotfiles(staging_dir, options.install_dir)
        print 'Success - dotfiles installed to %s' % options.install_dir
