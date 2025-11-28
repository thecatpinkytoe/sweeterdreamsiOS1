{\rtf1\ansi\ansicpg1252\cocoartf1504\cocoasubrtf840
{\fonttbl\f0\fswiss\fcharset0 Helvetica;\f1\fnil\fcharset0 AppleColorEmoji;\f2\fnil\fcharset0 LucidaGrande;
}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 #!/usr/bin/env bash\
set -euo pipefail\
echo "
\f1 \uc0\u55357 \u56633 
\f0  Quick build script (cloud VM) \'97 SweeterDreams"\
\
# 1. Install xcodegen if missing\
if ! command -v xcodegen >/dev/null 2>&1; then\
  echo "Installing xcodegen..."\
  brew install xcodegen\
fi\
\
# 2. Generate Xcode project\
echo "Generating Xcode project from project.yml..."\
xcodegen generate || \{ echo "
\f1 \uc0\u10060 
\f0  xcodegen failed"; exit 1; \}\
\
# 3. If Podfile exists, install pods\
if [ -f "Podfile" ]; then\
  echo "Installing CocoaPods..."\
  pod install || \{ echo "
\f1 \uc0\u10060 
\f0  pod install failed"; exit 1; \}\
fi\
\
# 4. Open the project to let the user set signing (manual step)\
echo "
\f1 \uc0\u55357 \u56633 
\f0  Opening Xcode project. Please set signing & team, then build on the machine."\
open HealthExportKit.xcodeproj || echo "Open failed; run Xcode manually."\
\
echo "When signing is complete, build via Xcode (Product 
\f2 \uc0\u8594 
\f0  Archive), then Export IPA."\
echo "If using free provisioning, connect your device and Build & Run to install the app."\
}