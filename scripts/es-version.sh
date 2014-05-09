#!/bin/sh

curl -s localhost:9200/_cluster/nodes\?all | python2 -c'
import sys, json
d = json.load(sys.stdin)
for id, n in d["nodes"].iteritems():
  print "%s %s %s %s" % (n["version"],
                         n["jvm"]["vm_name"],
                         n["jvm"]["version"],
                         n["transport"]["bound_address"])
'
