# 🛠️ DroidPenKit.ps1 — Ferramenta de Automação para Pentest Mobile Android (ADB & Frida)

O DroidPenKit é um script em PowerShell desenvolvido para automatizar tarefas comuns em testes de segurança mobile em ambientes Android. Ele integra o uso de ADB, Emulador Android e Frida, oferecendo uma interface interativa por linha de comando para facilitar operações de análise, injeção de scripts, instalação de APKs, gerenciamento de pacotes e muito mais.

🔹 Principais Recursos:

- Automação completa de comandos ADB

- Suporte a emuladores Android (AVD)

- Execução e controle de Frida Server / Scripts JS

- Instalação, remoção e manipulação de APKs

- Captura de logs e filtragem com logcat / grep / PID

- Gerenciamento de permissões, pacotes e dados de aplicativos

- Execução por menu interativo ou via parâmetros diretos (.\DroidPenKit.ps1 5)

💻 Ideal para analistas de segurança, desenvolvedores e pentesters que buscam agilidade e padronização nos testes de aplicativos Android.

---

# 🛠 Ferramentas Necessárias para funcionamento


🔹 Android SDK Platform-Tools (adb)

Comunicação com dispositivos e emuladores. O script chama diretamente o adb.exe em:
%USERPROFILE%\AppData\Local\Android\Sdk\platform-tools\adb.exe

🔹 Verifique:

& "$env:USERPROFILE\AppData\Local\Android\Sdk\platform-tools\adb.exe" version


Alternativa: adicione platform-tools ao PATH para chamar adb diretamente.

🔹Android Emulator (emulator)

Listagem e inicialização de AVDs (várias opções do menu usam isso). Path padrão no script:
%USERPROFILE%\AppData\Local\Android\Sdk\emulator\emulator.exe

🔹Verifique:

- & "$env:USERPROFILE\AppData\Local\Android\Sdk\emulator\emulator.exe" -version

- Frida (frida, frida-ps)

Listar processos, aplicações e injetar scripts (várias opções do menu — inclusive múltiplos scripts).

🔹Instale via pip: pip install frida-tools frida (ou conforme sua preferência).

Verifique:

- frida --version
- frida-ps --version



🔹 Como checar rapidamente (exemplos)
- & "$env:USERPROFILE\AppData\Local\Android\Sdk\platform-tools\adb.exe" version
- & "$env:USERPROFILE\AppData\Local\Android\Sdk\emulator\emulator.exe" -version
- frida --version
- frida-ps --version

---
## 🧠 Referências

- [OWASP Mobile Top 10](https://owasp.org/www-project-mobile-top-10/)
- [Android Security Guide](https://source.android.com/security)
- [iOS Security Guide](https://support.apple.com/guide/security/welcome/web)
- [Mobile Security Testing Guide (MSTG)](https://mobile-security.gitbook.io/mobile-security-testing-guide/)

---

## ⚠️ Aviso Legal

> Este repositório tem fins **educacionais**. Não me responsabilizo pelo uso indevido das técnicas e ferramentas aqui apresentadas. Utilize com ética e responsabilidade.

---

## 🤝 Contribuindo

Contribuições são bem-vindas! Sinta-se à vontade para abrir *issues* ou enviar *pull requests* com correções, melhorias ou novos conteúdos.

---

## 📧 Contato

Caso queira trocar ideias ou sugerir algo:

- [Carlos Tuma](https://github.com/carlosalbertotuma)
- E-mail: bl4dsc4n@gmail.com

