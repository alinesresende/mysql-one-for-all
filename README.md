# Boas vindas ao repositório do projeto One For All

Para desenvolver os projetos, você deverá seguir as instruções a seguir. Fique atento a cada passo e, se tiver qualquer dúvida, nos envie por Slack! #vqv 🚀

Aqui você vai encontrar os detalhes de como estruturar o desenvolvimento do seu projeto a partir deste repositório, utilizando uma branch específica e um Pull Request para colocar seus códigos.

<details>
<summary>📃 Termos e acordos</summary><br>

Ao iniciar este projeto, você concorda com as diretrizes do [Código de Conduta](https://app.betrybe.com/learn/student-manual/codigo-de-conduta-da-pessoa-estudante) e do [Manual da Pessoa Estudante](https://app.betrybe.com/learn/student-manual) da Trybe.

</details>

## Entregáveis

<details>
  <summary>🤷🏽‍♀️ Como entregar</summary><br />

Para entregar o seu projeto você deverá criar um Pull Request neste repositório.

Lembre-se que você pode consultar nosso conteúdo sobre [Git & GitHub](https://app.betrybe.com/learn/course/5e938f69-6e32-43b3-9685-c936530fd326/module/fc998c60-386e-46bc-83ca-4269beb17e17/section/fe827a71-3222-4b4d-a66f-ed98e09961af/day/35e03d5e-6341-4a8c-84d1-b4308b2887ef/lesson/573db55d-f451-455d-bdb5-66545668f436) e nosso [Blog - Git & GitHub](https://blog.betrybe.com/tecnologia/git-e-github/) sempre que precisar!
</details>

<details>
  <summary>👨‍💻 O que deverá ser desenvolvido</summary><br />

No projeto ***One For All***, você usará **algumas** tabelas para revisar e consolidar **todos** os principais conceitos vistos até o momento.

Você receberá planilhas não normalizadas que deverão ser normalizadas e populadas em um banco de dados para que você possa executar queries com o intuito de encontrar as informações solicitadas.

</details>

<details>
  <summary>🗓 Data de Entrega</summary><br />

  - Serão `2` dias de projeto.
  - Data de entrega para avaliação regular do projeto: `16/05/2023 14:00`.

</details>

## Orientações

<details>
<summary> 🐳 Início rápido com Docker Compose</summary><br>

```bash
docker-compose up -d
docker exec -it one_for_all bash
npm test # roda todos os testes
npm test -- -t "01" # rodando apenas o teste do requisito 01
```

<details>
<summary>🐳 Mais informações</summary><br>

O que cada comando faz:

- `docker-compose up -d`
  - Inicia os serviços `node` e `db`
    - Esses serviços irão inicializar um container chamado `one_for_all` e outro chamado `one_for_all_db`.
    - Ao iniciar pela primeira vez, o docker constrói a imagem do serviço `node`, instalando as dependências Node necessárias para a avaliação automatizada
- `docker exec -it one_for_all bash`
  - Acessa a linha de comando do container `one_for_all`
    - Isso dá acesso ao terminal interativo do container criado pelo compose, que está rodando em segundo plano
- `npm test`
  - Roda os testes do avaliador

> As credenciais de acesso ao banco de dados estão definidas no arquivo `docker-compose.yml`, e são acessíveis no container através das variáveis de ambiente `MYSQL_USER` e `MYSQL_PASSWORD`.

</details>
</details>

<details>
<summary>🖥️ Início rápido com apenas um container MySQL</summary><br>

> ⚠️ **Atenção**: É necessário criar um container MySQL e passar as credenciais através de variáveis de ambiente. Veja a [FAQ](./FAQ.md#rodando-o-projeto-localmente) para mais detalhes.
>
> ⚠️ O avaliador espera que a versão do `node` utilizada seja a 16.

```bash
npm install
docker run -p 3306:3306 --name mysql_8 -e MYSQL_ROOT_PASSWORD=password --platform=linux/amd64 -d mysql:8.0.23 mysqld --default-authentication-plugin=mysql_native_password
MYSQL_USER=root MYSQL_PASSWORD=password MYSQL_HOSTNAME=localhost npm test # roda todos os testes
MYSQL_USER=root MYSQL_PASSWORD=password MYSQL_HOSTNAME=localhost npm test -- -t "01" # rodando apenas o teste do requisito 01
```

<details>
<summary>🖥️ Mais informações</summary><br>

O que cada comando faz:

- `npm install`
  - Instala as dependências Node necessárias para os testes do avaliador
- `docker run -p 3306:3306 --name mysql_8 -e MYSQL_ROOT_PASSWORD=password --platform=linux/amd64 -d mysql:8.0.23 mysqld --default-authentication-plugin=mysql_native_password`
  - Cria um container MySQL com as variáveis de ambiente definidas
- `MYSQL_USER=root MYSQL_PASSWORD=password MYSQL_HOSTNAME=localhost npm test`
  - Roda os testes do avaliador passando as variáveis de ambiente

</details>
</details>

<details>
<summary> 👩🏼‍💻 Como desenvolver</summary><br>

Algumas coisas devem seguir um padrão pré-estabelecido para que os testes de correção funcionem adequadamente:

1. Para cada desafio, crie um arquivo SQL e inclua sua solução nele.

   - **Todos** os desafios que pedirem para criar uma query **devem** possuir no seu arquivo `.sql` correspondente **somente** a query solicitada.

2. Crie o arquivo **na pasta `challenges` do projeto** chamado `desafioN.sql`, em que N é o número do desafio (exemplo: `desafio3.sql`).

   - 💡**Dica**: Use o seguinte comando para gerar os arquivos:

      ```bash
      touch challenges/desafio{1..11}.sql
      ```

3. Ao modelar o banco de dados no [desafio 1](#desafio-1) ou [desafio 10](#desafio-10):

   - Quando for preciso que uma `coluna_a` referencie uma coluna `coluna_b` em outra tabela, é **necessário** que na `coluna_a` haja restrição de foreign key e que `coluna_b` seja uma primary key;

   - É preciso preencher também os arquivos de configurações `desafio1.json` e `desafio10.json` *também na pasta `challenges` do projeto*.

4. Os arquivos dos desafios de consultas (desafios 2 a 9, 11 a 13) devem:

   - Conter apenas a query SQL do desafio resolvido, pois o retorno desta única query é o que será avaliado.

5. Atente-se a detalhes de digitação em seu código. Qualquer diferença em nomes, apelidos, ou CAIXA ALTA e caixa baixa podem invalidar suas respostas.
   - **Não se esqueça de incluir o ponto e vírgula (";")** no final de suas queries.

6. Faça isso até finalizar todos os desafios e depois siga as instruções de como entregar o projeto na seção **Git e Github** na [FAQ](./FAQ.md#git-e-github).

7. Para entregar o seu projeto você deverá criar um *Pull Request* neste repositório. Este *Pull Request* deverá conter tanto os arquivos de configurações `desafio1.json` e `desafio10.json` quanto os arquivos `desafio1.sql`, `desafio2.sql` e assim por diante até o `desafio13.sql`, que conterão seu código `SQL` de cada desafio, respectivamente.

   - **⚠️ É importante que seus arquivos tenham exatamente estes nomes! ⚠️**

</details>

### 💡 Dica: Qualquer dúvida, dê uma olhada na [FAQ](./FAQ.md) ou procure a monitoria. Bom projeto! 🚀

### **🗣 Nos dê feedbacks sobre o projeto**

Ao finalizar e submeter o projeto, não se esqueça de avaliar sua experiência preenchendo o formulário.
**Leva menos de 3 minutos!**

[FORMULÁRIO DE AVALIAÇÃO DE PROJETO](https://be-trybe.typeform.com/to/ZTeR4IbH#cohort_hidden=CH28-A&template=betrybe/sd-0x-mysql-one-for-all)

## Requisitos obrigatórios

⚠️ **AVISO IMPORTANTE:** Você deve escrever sua query manualmente, com o gerador automático de queries do Workbench o avaliador não funcionará corretamente!

Você recebeu uma planilha não normalizada semelhante ao que poderia ser uma versão simplificada do banco de dados do Spotify. O trabalho consistirá de duas partes:

1. Normalizar essa planilha, criar as tabelas no seu banco de dados local e populá-lo;

2. Realizar os desafios no seu banco normalizado e populado.

## Desafio 1

### Parte 1 - Normalize as tabelas da planilha SpotifyClone

<details>
<summary>🎲 Planilha SpotifyClone</summary><br />

Abaixo você pode visualizar e baixar uma planilha com as tabelas que deverão ser normalizadas:

> **Observação:** O banco de dados real do Spotify é muito mais completo e complexo que o mostrado abaixo. No entanto, use APENAS as informações passadas e solicitadas aqui. Não crie dados que não foram solicitados.

[![Tabela não normalizada "Spotify Clone"](./images/non-normalized-tables.png)](./SpotifyClone-Non-NormalizedTable.xlsx)
[Faça o download dela aqui](./SpotifyClone-Non-NormalizedTable.xlsx)

<details>
<summary>🖥️ Software para acessar planilhas</summary><br />

Como o VS Code não oferece suporte nativo para abrir planilhas, você precisa ter algum software especifico para isso, aqui deixamos algumas sugestões:

- [LibreOffice Calc](https://www.libreoffice.org/download/download/) para distros Linux;
- [Numbers](https://www.apple.com/br/numbers/) para Mac OS;
- [Google planilhas](https://docs.google.com/spreadsheets) para utilizar no browser;
- Extensão para o VS Code como a [Excel Viewer](https://marketplace.visualstudio.com/items?itemName=GrapeCity.gc-excelviewer);

> Obs. Em alguns SOs é de costume vir instalado algum programa para manipular planilhas.

</details>

Antes de tudo, você deverá modelar e normalizar essas tabelas para a **3° Forma Normal**.

Monte quantas planilhas e tabelas forem necessárias para criar essa versão normalizada desde que você siga as regras de negócio. Não é necessário criar o código SQL neste momento.

> 💡 **Dica**: Embora não seja necessário, é recomendado que você crie suas planilhas na sequência 1ª -> 2ª -> 3ª Forma Normal

Caso haja dúvidas, consulte o material já passado até hoje para te auxiliar.

</details>

<details>
<summary>📖 Regras de negócio do banco de dados</summary><br />

Seu banco de dados deve seguir as regras de negócio e ser capaz de recuperar:

- Informações sobre quais planos estão disponíveis e seus detalhes;
  - Cada pessoa usuária pode possuir apenas um plano.

- Informações sobre todas as pessoas artistas;
  - Uma pessoa artista pode ter vários álbuns;
  - Uma pessoa artista pode ser seguida por várias pessoas usuárias.

- Informações sobre todos os álbuns de cada artista;
  - Para fins deste projeto, considere que cada álbum possui apenas uma pessoa artista como principal;
  - Cada álbum possui várias canções.

- Informações sobre todas as canções de cada álbum;
  - Para fins deste projeto, considere que cada canção está contida em apenas um álbum.

- Informações sobre todas as pessoas usuárias, seus planos, seu histórico de reprodução e pessoas artistas seguidas.
  - Uma pessoa usuária pode possuir apenas um plano;
  - Cada música do histórico de reprodução pode aparecer uma única vez por pessoa (para simplificar, considere que o objetivo do histórico é saber **quais** canções já foram reproduzidas e **não quantas vezes** foram reproduzidas);
  - Uma pessoa usuária pode seguir várias pessoas artistas, mas cada pessoa artista pode ser seguida apenas uma vez por pessoa usuária.

</details>

### Parte 2 - Após a normalização, crie as tabelas no banco de dados

A planilha acima foi normalizada? Ótimo! Agora siga com os passos abaixo:

- Crie um banco com o nome de **`SpotifyClone`**.

- Providencie as queries necessárias para criar tabelas normalizadas que atendam às regras de negócio descritas anteriormente;

- Providencie as queries necessárias para popular as tabelas do banco de dados de acordo com as dados da planilha fornecida anteriormente;

- Ajuste o arquivo de configurações `desafio1.json`, que mapeará em qual tabela e coluna se encontram as informações necessárias para a avaliação automatizada deste desafio.

  <details>
  <summary>👇 As configurações devem possuir o seguinte formato</summary><br />

  ```json
  {
    "tabela_pessoas_usuarias": "nome-da-tabela-de-pessoas-usuárias",
    "coluna_pessoas_usuarias": "nome-da-coluna-da-pessoa-usuária",
    "tabela_plano": "nome-da-tabela-do-plano",
    "coluna_plano": "nome-da-coluna-do-plano",
    "tabela_historico_de_reproducoes": "nome-da-tabela-do-histórico-de-reproduções",
    "coluna_historico_de_reproducoes": "nome-da-coluna-da-canção",
    "tabela_seguindo_artistas": "nome-da-tabela-de-seguidores-dos-artistas",
    "coluna_seguindo_artistas": "nome-da-coluna-da-artista",
    "tabela_artista": "nome-da-tabela-de-artistas",
    "coluna_artista": "nome-da-coluna-da-pessoa-artista",
    "tabela_album": "nome-da-tabela-de-álbuns",
    "coluna_album": "nome-da--coluna-do-álbum",
    "tabela_cancoes": "nome-da-tabela-de-canções",
    "coluna_cancoes": "nome-da-coluna-da-canção"
  }
  ```

  Essa configuração deve ser feita baseada no seu banco de dados **após a normalização**. Ou seja, se você criou uma tabela chamada `users` que possui a coluna `name`, você substituiria `"coluna_pessoa_usuaria"` e `"tabela_pessoa_usuaria"` da seguinte forma:

  ```json
  {
    "tabela_pessoa_usuaria": "users",
    "coluna_pessoa_usuaria": "name",
    ...
  }
  ```

</details>

- Salve as queries criadas no arquivo `desafio1.sql`.
  <details>
  <summary> 👇 Seu código deverá ser similar ao seguinte</summary><br />

    ```sql
    DROP DATABASE IF EXISTS SpotifyClone;

    CREATE DATABASE SpotifyClone;

    CREATE TABLE SpotifyClone.tabela1(
        coluna1 tipo restricoes,
        coluna2 tipo restricoes,
        colunaN tipo restricoes,
    ) engine = InnoDB;

    CREATE TABLE SpotifyClone.tabela2(
        coluna1 tipo restricoes,
        coluna2 tipo restricoes,
        colunaN tipo restricoes,
    ) engine = InnoDB;

    INSERT INTO SpotifyClone.tabela1 (coluna1, coluna2)
    VALUES
      ('exemplo de dados 1', 'exemplo de dados A'),
      ('exemplo de dados 2', 'exemplo de dados B'),
      ('exemplo de dados 3', 'exemplo de dados C');

    INSERT INTO SpotifyClone.tabela2 (coluna1, coluna2)
    VALUES
      ('exemplo de dados 1', 'exemplo de dados X'),
      ('exemplo de dados 2', 'exemplo de dados Y');
    ```

  </details>

<details>
<summary>✨ Dicas</summary><br />

- A normalização de tabelas pode ser um pouco abstrata. Uma base teórica vai te ajudar, então consulte o conteúdo sobre Normalização de Tabelas sem moderação!
- Nesse requisito, durante a normalização, será necessário criar tabelas que referenciam chaves primárias de outras, criando relacionamentos que pode ser:
  - 1:1 - Por exemplo, um ISBN só pode pertencer a um livro e um livro só pode ter um ISBN (ISBN é um número único de registro de um livro);
  - 1:N - Por exemplo, uma série pode ter vários episódios, mas um episódio só pertence a uma série;
  - N:M - Por exemplo, um filme pode ter vários atores e um ator pode atuar em vários filmes, porém nem a tabela atores dever manter dados de filmes, e nem a de filmes deve manter dados.
- Após criar suas tabelas normalizadas na planilha, é possível usar ferramentas de conversão de tabelas como o site [TableConvert](https://tableconvert.com/excel-to-sql) para gerar os comandos SQL `INSERT` mais rapidamente.
  
  ⚠️ **Atenção**: Será necessário ajustar os comandos gerados para se ter os relacionamentos e tipos de campos corretos na tabela.
  
  <details><summary>GIF de demonstração da ferramenta</summary>
  
  ![Convertendo uma tabela do Excel para SQL INSERTs no site TableConvert](images/table-convert.gif)
  
  </details>

</details>

<details>
<summary>☑️ O que será verificado</summary><br />

- Será validado se os planos estão na tabela normalizada.

- Será validado se o histórico de reprodução está na tabela normalizada.

- Será validado se as informações sobre pessoas seguindo artistas estão na tabela normalizada.

- Será validado se os álbuns estão na tabela normalizada.

- Será validado se as canções estão na tabela normalizada.

- Será validado se as informações sobre pessoas usuárias estão na tabela normalizada.

- Será validado se as informações sobre artistas estão na tabela normalizada.

  ⚠️ Note que uma vez executado um teste, a sua base de dados `SpotifyClone` **será dropada**. Logo, **se atente** a salvar seu progresso nos arquivos de desafio! ⚠️

</details>

---

## Desafio 2

Crie uma `QUERY` que exiba três colunas:

1. A primeira coluna deve exibir a quantidade total de canções. Dê a essa coluna o alias "**cancoes**".

2. A segunda coluna deve exibir a quantidade total de artistas e deverá ter o alias "**artistas**".

3. A terceira coluna deve exibir a quantidade de álbuns e deverá ter o alias "**albuns**".

✨ Dica: Considerando que a tabela está normalizada, você pode usar as chaves estrangeiras para juntar as tabelas, ou usar *sub-queries* de forma que seja possível extrair o resultado

<details>
  <summary>➕ Informações complementares</summary><br />

Sua `QUERY` deve retornar a seguinte informação:

| cancoes | artistas | albuns |
|---------|----------|--------|
| 10      | 6        | 8      |

O que será verificado:

- Será validado se existe uma `QUERY` que exibe os dados corretos nas colunas `cancoes`, `artistas` e `albuns`.

</details>

---

## Desafio 3

Crie uma `QUERY` que deverá ter apenas três colunas:

1. A primeira coluna deve possuir o alias "**pessoa_usuaria**" e exibir o nome da pessoa usuária.

2. A segunda coluna deve possuir o alias "**musicas_ouvidas**" e exibir a quantidade de músicas ouvida pela pessoa com base no seu histórico de reprodução.

3. A terceira coluna deve possuir o alias "**total_minutos**" e exibir a soma dos minutos ouvidos pela pessoa usuária com base no seu histórico de reprodução.

Os resultados devem estar agrupados pelo nome da pessoa usuária e ordenados em ordem alfabética.

✨ Dica: Consulte o conteúdo do dia de `Funções mais usadas no SQL`.

<details>
  <summary>➕ Informações complementares</summary><br />

Sua `QUERY` deve retornar a seguinte informação:

| pessoa_usuaria        | musicas_ouvidas | total_minutos |
|-----------------------|-----------------|---------------|
| Ada Lovelace          | 2               | 7.82          |
| Barbara Liskov        | 3               | 12.27         |
| Bell Hooks            | 1               | 3.38          |
| Christopher Alexander | 1               | 3.38          |
| Jorge Amado           | 1               | 1.93          |
| Judith Butler         | 1               | 4.07          |
| Martin Fowler         | 1               | 4.45          |
| Paulo Freire          | 2               | 8.10          |
| Robert Cecil Martin   | 2               | 5.12          |
| Sandi Metz            | 2               | 6.98          |

O que será verificado:

- Será validado se existe uma `QUERY` que exibe os dados corretos nas colunas `pessoa_usuaria`, `musicas_ouvidas` e `total_minutos`.

- Será validado se as colunas estão ordenadas de forma correta.

</details>

---

## Desafio 4

Crie uma `QUERY` que deve mostrar as pessoas usuárias que estavam ativas **a partir do ano de 2021**, se baseando na data mais recente no histórico de reprodução.

1. A primeira coluna deve possuir o alias "**pessoa_usuaria**" e exibir o nome da pessoa usuária.

2. A segunda coluna deve ter o alias "**status_pessoa_usuaria**" e exibir se a pessoa usuária está ativa ou inativa.

O resultado deve estar ordenado em ordem alfabética.

✨ Dica: Consulte o conteúdo do dia de `Funções mais usadas no SQL`.

<details>
  <summary>➕ Informações complementares</summary><br />

Sua `QUERY` deve retornar a seguinte informação:

| pessoa_usuaria        | status_pessoa_usuaria |
|-----------------------|-----------------------|
| Ada Lovelace          | Inativa               |
| Barbara Liskov        | Ativa                 |
| Bell Hooks            | Inativa               |
| Christopher Alexander | Inativa               |
| Jorge Amado           | Inativa               |
| Judith Butler         | Ativa                 |
| Martin Fowler         | Ativa                 |
| Paulo Freire          | Inativa               |
| Robert Cecil Martin   | Ativa                 |
| Sandi Metz            | Ativa                 |

O que será verificado:

- Será validado se existe uma `QUERY` que exibe os dados corretos nas colunas `pessoa_usuaria` e `status_pessoa_usuaria`.

- Será validado se as colunas estão ordenadas de forma correta.

</details>

---

## Desafio 5

Estamos fazendo um estudo das músicas mais tocadas e precisamos saber quais são as duas músicas mais tocadas no momento. Crie uma `QUERY` que possua duas colunas:

1. A primeira coluna deve possuir o alias "**cancao**" e exibir o nome da canção.

2. A segunda coluna deve possuir o alias "**reproducoes**" e exibir a quantidade de pessoas que já escutaram a canção em questão.

Seu resultado deve estar ordenado em ordem decrescente, baseando-se no número de reproduções. Em caso de empate, ordene os resultados pelo nome da canção em ordem alfabética. Queremos apenas o top 2 de músicas mais tocadas.

<details>
  <summary>➕ Informações complementares</summary><br />

Sua `QUERY` deve retornar a seguinte informação:

| cancao         | reproducoes |
|----------------|-------------|
| Feeling Good   | 3           |
| Samba em Paris | 3           |

O que será verificado:

- Será validado se existe uma `QUERY` que exibe os dados corretos nas colunas `cancao` e `reproducoes`.

- Será validado se as colunas estão ordenadas de forma correta.

</details>

---

## Desafio 6

Tendo como base o valor dos planos e o plano que cada pessoa usuária cadastrada possui no banco, queremos algumas informações sobre o faturamento da empresa. Crie uma `QUERY` que deve exibir quatro dados:

1. A primeira coluna deve ter o alias "**faturamento_minimo**" e exibir o menor valor de plano existente para uma pessoa usuária.

2. A segunda coluna deve ter o alias "**faturamento_maximo**" e exibir o maior valor de plano existente para uma pessoa usuária.

3. A terceira coluna deve ter o alias "**faturamento_medio**" e exibir o valor médio dos planos possuídos por pessoas usuárias até o momento.

4. Por fim, a quarta coluna deve ter o alias "**faturamento_total**" e exibir o valor total obtido com os planos possuídos por pessoas usuárias.

Para cada um desses dados, por se tratarem de valores monetários, deve-se arredondar o faturamento usando apenas duas casas decimais.

✨ Dica: O `ROUND` pode ser útil aqui, mas não vai criar casas decimais extras, se precisar disto busque uma função que vai fazer essa formatação.

<details>
  <summary>➕ Informações complementares</summary><br />

Sua `QUERY` deve retornar a seguinte informação:

| faturamento_minimo | faturamento_maximo | faturamento_medio | faturamento_total |
|--------------------|--------------------|-------------------|-------------------|
| 0.00               | 7.99               | 5.69              | 56.92             |

O que será verificado:

- Será validado se existe uma `QUERY` que exibe os dados corretos nas colunas `faturamento_minimo`, `faturamento_maximo`, `faturamento_medio` e `faturamento_total`.

</details>

---

## Desafio 7

Mostre uma relação de todos os álbuns produzidos por cada pessoa artista, ordenada pela quantidade de seguidores que ela possui, de acordo com os detalhes a seguir. Para tal, crie uma `QUERY` com as seguintes colunas:

1. A primeira coluna deve exibir o nome da pessoa artista, com o alias "**artista**".

2. A segunda coluna deve exibir o nome do álbum, com o alias "**album**".

3. A terceira coluna deve exibir a quantidade de pessoas seguidoras que aquela pessoa artista possui e deve possuir o alias "**pessoas_seguidoras**".

Seus resultados devem estar ordenados de forma decrescente, baseando-se no número de pessoas seguidoras. Em caso de empate no número de pessoas, ordene os resultados pelo nome da pessoa artista em ordem alfabética e caso existam artistas com o mesmo nome, ordene os resultados pelo nome do álbum alfabeticamente.

<details>
  <summary>➕ Informações complementares</summary><br />

Sua `QUERY` deve retornar a seguinte informação:

| artista           | album                | pessoas_seguidoras |
|-------------------|----------------------|--------------------|
| Beyoncé           | Renaissance          | 3                  |
| Elis Regina       | Falso Brilhante      | 3                  |
| Elis Regina       | Vento de Maio        | 3                  |
| Nina Simone       | I Put A Spell On You | 3                  |
| Queen             | Hot Space            | 3                  |
| Queen             | Jazz                 | 3                  |
| Baco Exu do Blues | QVVJFA?              | 1                  |
| Blind Guardian    | Somewhere Far Beyond | 1                  |

O que será verificado:

- Será validado se existe uma `QUERY` que exibe os dados corretos nas colunas `artista`, `album` e `pessoas_seguidoras`.

- Será validado se as colunas estão ordenadas de forma correta.

</details>

---

## Desafio 8

Mostre uma relação dos álbuns produzidos por uma pessoa artista específica, neste caso `"Elis Regina"`.
Para isto crie uma `QUERY` que o retorno deve exibir as seguintes colunas:

1. O nome da pessoa artista, com o alias "**artista**".

2. O nome do álbum, com o alias "**album**".

Os resultados devem ser ordenados pelo nome do álbum em ordem alfabética.

<details>
  <summary>➕ Informações complementares</summary><br />

Sua `QUERY` deve retornar a seguinte informação:

| artista     | album           |
|-------------|-----------------|
| Elis Regina | Falso Brilhante |
| Elis Regina | Vento de Maio   |

O que será verificado:

- Será validado se a `QUERY` retorna a coluna `artista` contendo o nome da pessoa artista e a coluna `album` contendo o nome do álbum.

- Será validado se as colunas estão ordenadas de forma correta.

</details>

---

## Desafio 9

Crie uma `QUERY` que exibe a quantidade de músicas que estão presentes atualmente no histórico de reprodução de uma pessoa usuária específica. Para este caso queremos saber quantas músicas estão no histórico da usuária `"Barbara Liskov"` e a consulta deve retornar a seguinte coluna:

1. O valor da quantidade, com o alias "**musicas_no_historico**".

<details>
  <summary>➕ Informações complementares</summary><br />

Sua `QUERY` deve retornar a seguinte informação:

| musicas_no_historico |
|----------------------|
| 3                    |

O que será verificado:

- Será validado se a `QUERY` retorna a quantidade correta de canções presentes no histórico de reprodução da pessoa especificada.

</details>

---

## Requisitos Bônus

Você receberá uma planilha não normalizada que complementa o banco de dados do **SpotifyClone**, que é uma tabela de canções favoritas de cada pessoa usuária. O trabalho consistirá de duas partes:

1. Normalizar essa planilha, criar a tabela no seu banco de dados local e populá-lo;

2. Realizar os próximos desafios no seu banco atualizado com a tabela de canções favoritas.

## Desafio 10

### Parte 1 - Normalize a tabela da planilha SpotifyClone-fav-songs

> 💡 Dica: Se precisar reveja as dicas do [**desafio 1**](#desafio-1), elas podem ser muito úteis! 😉

<details>
<summary>🎲 Planilha SpotifyClone-fav-songs</summary><br />

Abaixo você pode visualizar e baixar uma planilha com a tabela que deverá ser normalizada:

[![Tabela não normalizada "Spotify Clone Fav Songs"](./images/non-normalized-table-fav-songs.png)](./SpotifyClone-Non-NormalizedTable-fav-songs.xlsx)
[Faça o download dela aqui](./SpotifyClone-Non-NormalizedTable-fav-songs.xlsx)

Você deverá modelar e normalizar essa tabela para a **3° Forma Normal**.

Monte quantas planilhas e tabelas forem necessárias para criar essa versão normalizada desde que você siga as regras de negócio. Não é necessário criar o código SQL neste momento.

</details>

<details>
<summary>📖 Regras de negócio do banco de dados</summary><br />

Seu banco de dados deve seguir as regras de negócio e ser capaz de recuperar:

- Informações sobre as canções favoritas das pessoas usuárias.
  - Uma pessoa usuária pode possuir várias canções favoritas;
  - Uma canção pode ser favoritada por várias pessoas usuárias.

</details>

### Parte 2 - Após a normalização, crie a tabela no banco de dados

- Providencie as queries necessárias para criar a tabela normalizada que atenda às regras de negócio descritas anteriormente;
- Providencie as queries necessárias para popular a tabela no banco de dados de acordo com as dados da planilha fornecida anteriormente;

- Ajuste o arquivo de configurações `desafio10.json`, que mapeará a nova tabela para a avaliação automatizada deste desafio.

  <details>
    <summary>👇 As configurações devem possuir o seguinte formato</summary><br />

    ```json
    {
      "tabela_cancoes_favoritas": "nome-da-tabela-de-canções-favoritas",
      "coluna_cancoes_favoritas": "nome-da-coluna-de-canções-favoritas", 
    }
    ```

    Essa configuração deve ser feita baseada na sua nova tabela **após a normalização**.
  </details>

- Salve as queries criadas no arquivo `desafio10.sql`

  <details>
    <summary> 👇 Seu código deverá ser similar ao seguinte</summary><br />

    ```sql
    CREATE TABLE SpotifyClone.tabela1(
        coluna1 tipo restricoes,
        coluna2 tipo restricoes,
        colunaN tipo restricoes,
    ) engine = InnoDB;

    INSERT INTO SpotifyClone.tabela1 (coluna1, coluna2)
    VALUES
      ('exemplo de dados 1', 'exemplo de dados A'),
      ('exemplo de dados 2', 'exemplo de dados B'),
      ('exemplo de dados 3', 'exemplo de dados C');
    ```

  </details>

☑️ **O que será verificado**

- Será validado se as informações sobre canções favoritadas estão na tabela normalizada.

## Desafio 11

Crie uma `QUERY` que exibe o top 3 de álbuns com as músicas que mais foram favoritadas.

O resultado deve possuir duas colunas:

1. `album`: O nome do álbum

2. `favoritadas`: Quantas vezes as músicas do álbum foram favoritadas

Seu resultado deve estar ordenado em ordem decrescente, baseando-se no número de favoritadas. Em caso de empate, ordene os resultados pelo nome do álbum em ordem alfabética. Queremos apenas o top 3 de álbuns com mais músicas favoritadas.

<details>
  <summary>➕ Informações complementares</summary><br />

Sua `QUERY` deve retornar a seguinte informação:

| album                | favoritadas |
|----------------------|-------------|
| Renaissance          | 5           |
| Jazz                 | 3           |
| I Put A Spell On You | 2           |

O que será verificado:

- Será validado se a `QUERY` retorna a quantidade correta dos três álbuns com as canções que mais foram favoritadas pelas pessoas usuárias.

</details>

## Desafio 12

Crie uma `QUERY` que exibe um ranking de artistas baseado na quantidade de favoritadas em suas músicas.

O resultado deve possuir duas colunas:

1. `artista`: O nome da pessoa artista

2. `ranking`: Uma classificação definida pela quantidade de favoritadas as canções da pessoa artista receberam, como segue:

    | ranking | quantidade de favoritadas em canções |
    |---------|--------------------------------------|
    | A       | 5 ou mais                            |
    | B       | 3 - 4                                |
    | C       | 1 - 2                                |
    | -       | 0                                    |

Seu resultado deve estar ordenado em ordem decrescente, baseando-se no número de favoritadas. Em caso de empate, ordene os resultados pelo nome da pessoa artista em ordem alfabética.

<details>
  <summary>➕ Informações complementares</summary><br />

Sua `QUERY` deve retornar a seguinte informação:

| artista           | ranking |
|-------------------|---------|
| Beyoncé           | A       |
| Elis Regina       | B       |
| Queen             | B       |
| Nina Simone       | C       |
| Baco Exu do Blues | -       |
| Blind Guardian    | -       |

O que será verificado:

- Será validado se a `QUERY` retorna a quantidade correta de canções que mais foram favoritadas de cada pessoa artista.

</details>

## Desafio 13

Crie uma `QUERY` que exibe uma relação da quantidade total de pessoas usuárias e favoritadas por faixa etária.

O resultado deve possuir três colunas:

1. `faixa_etaria`: A faixa etária das pessoas usuárias, sendo elas:
   - `Até 30 anos`
   - `Entre 31 e 60 anos`
   - `Maior de 60 anos`

2. `total_pessoas_usuarias`: O total de pessoas usuárias na respectiva faixa etária

3. `total_favoritadas`: O total de favoritadas realizadas pelas pessoas usuárias da respectiva faixa etária

Seu resultado deve estar ordenado de acordo com a sequência das faixas etárias descritas acima.

<details>
  <summary>➕ Informações complementares</summary><br />

Sua `QUERY` deve retornar a seguinte informação:

| faixa_etaria       | total_pessoas_usuarias | total_favoritadas |
|--------------------|------------------------|-------------------|
| Até 30 anos        | 2                      | 0                 |
| Entre 31 e 60 anos | 6                      | 9                 |
| Maior de 60 anos   | 2                      | 4                 |

O que será verificado:

- Será validado se a `QUERY` retorna a quantidade correta de pessoas usuárias e favoritadas por faixa etária.

</details>
