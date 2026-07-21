# Homebrew Tesus

Tap Homebrew para instalar o **Tesus Browser** — navegador com o agente Aura embutido.

## Instalação

```sh
brew install --cask andersonflima/tesus/tesus-browser
```

Ou, em dois passos:

```sh
brew tap andersonflima/tesus
brew install --cask tesus-browser
```

## Atualizar

```sh
brew upgrade --cask tesus-browser
```

## Notas

- macOS Apple Silicon (arm64).
- A build é distribuída sem assinatura/notarização da Apple; o cask remove a quarentena automaticamente após instalar, então o app abre sem o bloqueio do Gatekeeper.
