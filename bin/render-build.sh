#!/usr/bin/env bash
set -o errexit

corepack enable
pnpm install --prod  # Instala só dependências de produção para reduzir tamanho
pnpm prune --prod    # Remove pacotes desnecessários
bundle install --without development test  # Ignora gems de dev/test

# Aumenta heap Node e desabilita features pesadas
export NODE_OPTIONS=--max-old-space-size=409  # Limite baixo para caber em 512MB

RAILS_ENV=production bundle exec rake assets:precompile
RAILS_ENV=production bundle exec rake assets:clean