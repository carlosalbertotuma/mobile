// list_modules_async.js
(function banner() {
  const bannerText = `
**************************************************************
*                                                            *
*     Flutter Modules Enumerator - Frida Script              *
*                                                            *
*  No estudo de segurança Android, criei este script para    *
*  Frida que facilita a enumeração e detecção da utilização  *
*  do Flutter em aplicativos mobile.                         *
*                                                            *
*  Ele detecta a utilização de Flutter e lista todas as      *
*  bibliotecas carregadas, mostrando também o endereço base  *
*  da amemória utilizada por cada módulo.                    *
*                                                            *
*  Útil para pesquisadores, pentesters e desenvolvedores.    *
*                                                            *
*  By Bl4dsc4n / flutter-detect.js  v.0.1                    *
**************************************************************
`;
  console.log(bannerText);
})();

(async function() {
  try {
    const modules = await Process.enumerateModules();
    
    // Filtra módulos que contenham 'flutter' no nome (case insensitive)
    const flutterModules = modules.filter(m => m.name.toLowerCase().includes('flutter'));
    
    if (flutterModules.length === 0) {
      console.log('[!] Nenhum módulo flutter encontrado.');
    } else {
      flutterModules.forEach(m => {
        console.log(`[+] Flutter Module: ${m.name} @ ${m.base}`);
      });
    }
    
    // Se quiser, lista todos os módulos para referência
    console.log('\n=== Todos os módulos carregados ===');
    modules.forEach(m => {
      console.log(`${m.name} @ ${m.base}`);
    });
    
  } catch (err) {
    console.error('[!] Erro ao enumerar módulos:', err);
  }
})();
