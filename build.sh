#!/bin/env python

import os, errno, subprocess

def check_build():
  build = os.path.join(os.getcwd(), "_build")
  if not os.path.isdir(build):
    try:
      os.makedirs(build)
    except OSError as e:
      if e.errno != errno.EEXIST:
        raise
  os.chdir(build)

def build():
  subprocess.call(['cmake', "-DCMAKE_CXX_FLAGS='-w -O3'", '-DCMAKE_CXX_STANDARD=14', '..'])
  subprocess.call(['make', '-j16'])
  
def install():
  subprocess.call(['make', 'install'])

def run():
  check_build()
  build()
  install()
  
  
if __name__ == "__main__":
  run()
