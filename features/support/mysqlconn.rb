#class MySQLconn
require 'mysql2'

'/
Projeto no github: https://github.com/brianmario/mysql2
Passos:
gem install mysql2
instala o mysql-connector-c-6.1.9, no site da mysql.
/'
class MySQL
  def initialize
    # CONSTANTES USADAS
    @USER_MYSQL = "root"
    @PASS_MYSQL = ""
    @HOST = "localhost"
    @DATABASE_NAME = ""
    @PORT_MYSQL = 3306

    # Conectando no banco de dados mysql.
    @client = Mysql2::Client.new(:host => @HOST, :username => @USER_MYSQL, :password => @PASS_MYSQL,
                                :database => @DATABASE_NAME, :port => @PORT_MYSQL, :connect_timeout => 30)
  end

  def query_test(string)
    # Executa a query e retorna o resultado.
    result = @client.query(string)
    return result
  end

end
