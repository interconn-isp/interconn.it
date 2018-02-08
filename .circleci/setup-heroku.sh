#!/bin/bash
git remote add heroku-staging git@heroku.com:interconn-v1-staging.git
git remote add heroku-production git@heroku.com:interconn-v1.git

cat >> ~/.ssh/config << EOF
  VerifyHostKeyDNS yes
  StrictHostKeyChecking no
EOF
