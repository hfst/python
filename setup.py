"""
setup for HFST-swig
"""

import os
from setuptools import setup, Extension

libhfst_module = Extension('_libhfst',
                           language = "c++",
                           sources = ["libhfst.i"],
                           swig_opts = ["-c++", "-Wall"],
#                           include_dirs = ["-I /usr/local/include/hfst -I /usr/include/hfst"],
                           library_dirs = [],
                           libraries = ["hfst"],
                           extra_link_args = [],
                           extra_objects = []
                           )

setup(name = 'libhfst_swig',
      version = '3.11.0_beta',
      author = 'HFST team',
      author_email = 'hfst-bugs@helsinki.fi',
      url = 'http://hfst.github.io/',
      description = 'SWIG-bound hfst interface',
      ext_modules = [libhfst_module],
      py_modules = ["libhfst"],
      packages = ["hfst", "hfst.exceptions", "hfst.rules", "hfst.types"],
      data_files = []
      )
