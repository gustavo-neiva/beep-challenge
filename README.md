Desafio Beep Saúde - Gráfico Cotações
==================================

[Desafio Beep Saúde](https://beep-saude-challenge.herokuapp.com/) - Exemplo no heroku

Esse projeto tem como objetivo criar uma simples página web que consome a API de cotações diárias e exibe esses dados em um gráfico utilizando a biblioteca Highcharts.

Decidi fazer utilizando o microframework Roda pois, além de ser um aplicativo simples, nunca havia utilizado esse framework e tive o interesse de aprender através desse exercício.

Optei por usar Cucumber + Watir para criar cenários de teste autmatizado conciliando BDD com a aplicação testada através da interação no browser.

O site de exemplo está utilizando uma conta grátis do serviço de cotaçoes com um limite de 1000 requests por mês.

Dependências
------------
- [Ruby](https://www.ruby-lang.org/en/documentation/installation/)
- [Ruby bundler gem](http://bundler.io/) || `gem install bundle`
- [Chromedriver](http://chromedriver.storage.googleapis.com/index.html)

Stack tecnológico
---------

- [Roda](https://roda.jeremyevans.net/) - Microframework em Ruby construídos sobre o Rack
- [Cucumber](https://cucumber.io/) - Suite de testes BDD onde a descrição dos testes é em Inglês
- [Watir](http://watir.com/) - Wrapper Selenium webdriver com sintaxe simples. Simula o browser
- [HTTP gem](https://github.com/httprb/http) - Gem para realizar requests HTTP
- [Lazy High Charts](https://github.com/michelson/lazy_high_charts) - Wrapper do Highcharts em Ruby
- [Bulma](https://bulma.io/) - Framework CSS free e open source baseado em flexbox

Instalação e uso
--------------------
Da linha de comando:

1. Clonar o projeto: `git clone https://github.com/luizgzn/beep-challenge`
2. Criar uma conta na [Currency Layer](https://currencylayer.com/)
3. Criar um arquivo `touch .env` e adicionar `CURRENCY_API_KEY=SUA_CHAVE_API` ao arquivo
4. Acessar o diretório e rodar o comando `bundle install` para instalar todas as gems.
5. Iniciar servidor WEBrick::HTTPServer `rackup`
6. Em outra aba do terminal rodar a suite de tests `cucumber`

To Do
--------------------------
- Mockar os request para API para nao utilizar a quota da API para teste e ter resultados consistentes
- Utilizar alguma forma de cache para salvar os requests feitos naquele dia, ja que os valores mudam a cada 24 e cada novo request consome a quota de uso da API
- Automatizar os testes por completo, talvez criando rake tasks para carregar o servidor, rodar os tests e depois limpar o servidor.
- Criar containeres com a aplicacao para nao ter problemas com as dependencias.
