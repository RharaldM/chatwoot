#!/usr/bin/env bash
set -o errexit

# Ativa o Corepack (necessário para respeitar o packageManager com hash)
corepack enable

# Instala pacotes com PNPM (substitui yarn install)
pnpm install

# Instala gems do Ruby
bundle install

# Pré-compila assets em modo production
RAILS_ENV=production bundle exec rake assets:precompile

# Limpa assets antigos (opcional)
RAILS_ENV=production bundle exec rake assets:clean