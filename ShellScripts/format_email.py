#!/usr/bin/env python

from pynliner import Pynliner
import sys, codecs

if len(sys.argv) < 3:
  print 'Please pass input file and output file as args.'
  exit(1)
else:
  file_report = sys.argv[1]
  file_report_formatted = sys.argv[2]

  f = codecs.open(file_report, 'r', 'utf-8')
  p = Pynliner()

  html = p.from_string(f.read()).run()

  new_file = codecs.open(file_report_formatted, 'w', 'utf-8')
  new_file.write(html)
  new_file.close()
  f.close()
