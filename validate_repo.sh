{\rtf1\ansi\ansicpg1252\cocoartf1504\cocoasubrtf840
{\fonttbl\f0\fswiss\fcharset0 Helvetica;\f1\fnil\fcharset0 AppleColorEmoji;\f2\fnil\fcharset0 AppleSymbols;
\f3\fnil\fcharset128 HiraginoSans-W3;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 #!/usr/bin/env bash\
set -euo pipefail\
echo "
\f1 \uc0\u55357 \u56590 
\f0  Running simple repo checks for SweeterDreams..."\
\
# 1) check required files\
REQUIRED=("project.yml" "Sources" "README.md")\
missing=0\
for f in "$\{REQUIRED[@]\}"; do\
  if [ ! -e "$f" ]; then\
    echo "
\f1 \uc0\u10071 
\f0  Missing: $f"\
    missing=1\
  fi\
done\
\
if [ "$missing" -eq 1 ]; then\
  echo "
\f1 \uc0\u10060 
\f0  Repo missing required files. Please add them to the repo before using VM."\
  exit 2\
fi\
\
# 2) check for Podfile / SwiftPM\
if [ -f "Podfile" ]; then\
  echo "
\f2 \uc0\u8505 
\f0  Podfile found. CI will run 'pod install'."\
fi\
\
# 3) check project.yml validity superficially\
if ! grep -q "name:" project.yml >/dev/null 2>&1; then\
  echo "
\f3 \uc0\u9888 
\f0  project.yml may be malformed (no 'name:' found)."\
fi\
\
echo "
\f1 \uc0\u9989 
\f0  Basic checks passed. Repo looks OK for cloud generation."\
exit 0\
}