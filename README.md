Meu Segundo projeto de Automação usando Ruby, Capybara, SitePrism, usando o conceito de Pages Object. Não temos nenhum Sleep fixo no projeto, tudo é feito de forma dinâmica. Não utilizamos xpath nesse projeto somente ID e CSS Selector, como boa prática procurei deixar o projeto relativamente simples. 
<br>O único paramêtro que é passado via cucumber é o browser. Ainda vou automatizar essa parte.
<br>Em pages temos duas páginas uma somente com funções e outra somente com os elementos, para ficar bem organizado.

### Instalação das Gems é necessário instalar primeiro o bundler ###
To install bundler type:
```shell
gem install bundler
```

##### Gems que vão ser instaladas #####

Gems necessário para rodar os testes:
source 'https://rubygems.org'

gem 'capybara'
gem 'cucumber'
gem 'rake'
gem 'selenium-webdriver'
gem 'site_prism'
gem 'rspec'
gem 'os'
gem 'rspec-retry'
gem 'mysql2'

### Installing gems ###
Primeiro Passo entrar na pasta do projeto via cmd ou shell e instalar as gems com o comando:
```shell
bundle install
```

### Drivers: ###
Baixa os drivers e colocar no c: da maquina:
https://www.dropbox.com/s/midwh10jy8p7e6o/drivers.zip?dl=0


### Automação de testes funcionais do site: ###
- Cadastro de novo usuário;
- Login e Logout;

### TAGS: ###
@cadastro -> Executa o teste da feature Realizar Cadastro de Novos Usuários.<br>
@login_logout -> Executa o teste da feature Realizar Testes de Login e Logout do Usuário.<br>

EXEMPLO DE COMANDO LOGIN:
```shell
cucumber -t @login_logout BROWSER=chrome
```
EXEMPLO DE COMANDO CADASTRO:
```shell
cucumber -t @cadastro BROWSER=chrome
```

### Ambiente Testado Windows 10 x64  e Linux Mint x64 ###
### Versões de Browser:#
firefox versão: 51.0<br>
chrome versão: 56.0

### HTML Report###
Para adicionar o report adicione o comando abaixo no cucumber:
```shell
--format progress --format html --out=features_report.html
```

