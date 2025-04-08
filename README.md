# Auto Primora

Este projeto contém a configuração de containers Docker para o ambiente de automação da Primora.

## Estrutura do Projeto

O projeto é composto por vários serviços containerizados usando Docker Compose:

1. Traefik (Proxy reverso)
2. Portainer (Gerenciamento de containers)
3. PostgreSQL (Banco de dados)
4. MinIO (Armazenamento de objetos)
5. Typebot Builder
6. Typebot Viewer
7. Evolution API

## Configuração de Ambiente

### Variáveis de Ambiente

O projeto utiliza um arquivo `.env` para gerenciar configurações sensíveis. Este arquivo não é versionado no Git por questões de segurança.

#### Estrutura do arquivo .env

```env
# PostgreSQL
POSTGRES_PASSWORD=suasenha
DATABASE_URL=postgresql://postgres:${POSTGRES_PASSWORD}@postgres:5432/typebot

# MinIO
MINIO_ROOT_USER=admin
MINIO_ROOT_PASSWORD=suasenha
MINIO_BROWSER_REDIRECT_URL=https://data-auto.primora.com.br
MINIO_SERVER_URL=https://apidata-auto.primora.com.br
```

### Arquivos de Configuração

- `1-traefik.yaml`: Configuração do proxy reverso
- `2-portainer.yaml`: Configuração do gerenciador de containers
- `3-postgres.yaml`: Configuração do banco de dados PostgreSQL
- `4-minio.yaml`: Configuração do serviço de armazenamento MinIO
- `5-typebot-builder.yaml`: Configuração do Typebot Builder
- `6-typebot-viewer.yaml`: Configuração do Typebot Viewer
- `7-evolution-completo.yaml`: Configuração da Evolution API

### Configurações do Typebot

O Typebot possui duas instâncias principais:

1. **Typebot Builder** (Editor):
   - URL: https://typebot-auto.primora.com.br
   - Configurações de SMTP para envio de e-mails
   - Integração com MinIO para armazenamento de arquivos

2. **Typebot Viewer** (Visualizador):
   - URL: https://apibot-auto.primora.com.br
   - Compartilha o mesmo banco de dados com o Builder
   - Configurações de SMTP para envio de e-mails
   - Integração com MinIO para armazenamento de arquivos

## Segurança

### Arquivos Ignorados (.gitignore)

O projeto inclui um arquivo `.gitignore` que exclui:

- Arquivos de ambiente (`.env`, `.env.*`)
- Arquivos do sistema (`.DS_Store`, `Thumbs.db`)
- Arquivos de IDE (`.idea/`, `.vscode/`, `*.swp`, `*.swo`)
- Arquivos de log (`*.log`)

## Como Usar

1. Clone o repositório:
```bash
git clone https://github.com/eleucarlos/auto-primora.git
```

2. Crie um arquivo `.env` baseado nas variáveis necessárias:
```bash
cp .env.example .env
```

3. Edite o arquivo `.env` com suas configurações específicas

4. Inicie os serviços:
```bash
docker-compose -f 1-traefik.yaml up -d
docker-compose -f 2-portainer.yaml up -d
docker-compose -f 3-postgres.yaml up -d
docker-compose -f 4-minio.yaml up -d
docker-compose -f 5-typebot-builder.yaml up -d
docker-compose -f 6-typebot-viewer.yaml up -d
docker-compose -f 7-evolution-completo.yaml up -d
```

## Requisitos

- Docker
- Docker Compose
- Acesso à internet para download das imagens
- Portas disponíveis para os serviços
- Domínios configurados:
  - typebot-auto.primora.com.br
  - apibot-auto.primora.com.br
  - data-auto.primora.com.br
  - apidata-auto.primora.com.br

## Manutenção

- Mantenha o arquivo `.env` atualizado com as configurações corretas
- Faça backup regular do banco de dados PostgreSQL
- Monitore o uso de recursos através do Portainer
- Verifique regularmente os logs dos serviços
- Mantenha as imagens Docker atualizadas

## Suporte

Para questões e suporte, entre em contato com a equipe de desenvolvimento.
