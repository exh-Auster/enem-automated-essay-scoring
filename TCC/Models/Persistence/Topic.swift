//
//  Topic.swift
//  TCC
//
//  Created by Felipe Ribeiro on 27/07/25.
//

import Foundation
import SwiftData

@Model
class Topic {
    var title: String = ""
    var source: String?
    var essays: [Essay]? = []
    var stimulusTexts: [[String: String]] = []
    
    init(title: String, source: String? = nil, essays: [Essay] = [], stimulusTexts: [[String: String]]) {
        self.title = title
        self.source = source
        self.essays = essays
        self.stimulusTexts = stimulusTexts
    }
}

extension Topic {
    static var topics: [Topic] = [
        Topic(
            title: "Desafios para a valorização da herança africana no Brasil",
            source: "ENEM 2024",
            stimulusTexts: [
                [
                    "title": "TEXTO I",
                    "body":
                        """
                        Herança - o legado de crenças, conhecimentos, técnicas, costumes, tradições, transmitido por um grupo social de geração para geração; cultura.
                        """,
                    "source":
                        """
                        HOUAISS, A.; VILLAR M. S. Dicionário Houaiss da língua portuguesa. Rio de Janeiro: Objetiva, 2009 (adaptado).
                        """
                ],
                [
                    "title": "TEXTO II",
                    "body":
                        """
                        As culturas africanas e afro-brasileiras foram relegadas ao campo do folclore com o propósito de confiná-las ao gueto fossilizado da memória. Folclorizar, nesse caso, é reduzir uma cultura a um conjunto de representações estereotipadas, via de regra, alheias ao contexto que produziu essa cultura.
                        """,
                    "source":
                        """
                        OLIVEIRA, E. D. A epistemologia da ancestralidade. Entrelugares: revista de sociopoética e abordagens afins, 2009.
                        """
                ],
                [
                    "title": "TEXTO III (figura transcrita)",
                    "body":
                        """
                        CAPÍTULO OITO

                        QUANDO NÃO SOUBERES
                        PARA ONDE IR, OLHA PARA TRÁS
                        E SAIBA PELO MENOS
                        DE ONDE VENS.

                        Provérbio africano
                        """,
                    "source":
                        """
                        PAULINO, R. Ainda a lamentar. In: GONÇALVES, A. M. Um defeito de cor: romance. Rio de Janeiro: Record, 2024 (adaptado).
                        """
                ],
                [
                    "title": "TEXTO IV",
                    "body":
                        """
                        História afro-brasileira nas escolas: professoras comentam avanços e dificuldades
                        
                        As aulas sobre escravidão eram motivo de vergonha para uma professora quando ela estudava em uma escola municipal na zona sul de São Paulo. "Era o meu pior momento na escola", lembra a ex-aluna. Naquela época, a história da população negra no Brasil era reduzida ao horror do período escravocrata. Não se falava na escola sobre temas como a história e a cultura afro-brasileira, muito menos sobre as grandes personalidades negras do pais, como Luiz Gama e Carolina Maria de Jesus.
                        
                        A pedagoga, que é negra, tem orgulho de oferecer uma experiência diferente da que viveu em sala de aula para seus alunos. Agora os livros infantis levados para as turmas têm protagonistas pretos. Temas como a beleza do cabelo crespo e o combate ao racismo fazem parte do dia a dia da escola.
                        """,
                    "source":
                        """
                        Disponível em: https://jornal.unesp.br.
                        Acesso em: 3 jun. 2024 (adaptado).
                        """
                ],
                [
                    "title": "TEXTO V",
                    "body":
                        """
                        Histórias para ninar gente grande
                        G.R.E.S. Estação Primeira de Mangueira
                        (samba-enredo de 2019)
                        
                        Brasil, meu nego
                        Deixa eu te contar
                        A história que a história não conta
                        O avesso do mesmo lugar
                        Na luta é que a gente se encontra
                        Brasil, meu dengo
                        A Mangueira chegou
                        Com versos que o livro apagou
                        Desde 1500 tem mais invasão do que descobrimento
                        Tem sangue retinto pisado
                        Atrás do herói emoldurado
                        Mulheres, tamoios, mulatos
                        Eu quero um país que não esta no retrato
                        Brasil, o teu nome é Dandara
                        E a tua cara é de cariri
                        Não veio do céu
                        Nem das mãos de Isabel
                        A liberdade é um dragão no mar de Aracati
                        Salve os caboclos de junho
                        Quem foi de aço nos anos de chumbo
                        Brasil, chegou a vez
                        Do ouvir as Marias, Mahins, Marielles, malês
                        """,
                    "source":
                        """
                        Disponível em: www.mangueira.com.br.
                        Acesso em: 30 maio 2024 (fragmento).
                        """
                ],
                [
                    "title": "TEXTO VI",
                    "body":
                        """
                        Alunos de escola municipal conhecem pontos do Rio que retratam relação com a África
                        
                        <imagem>
                        Foto: Brenno Carvalho / O Globo
                        
                        Alunos admiram grafite de Zumbi dos Palmares na Pedra do Sal.
                        """,
                    "source":
                        """
                        Disponível em: www.oglobo.com.
                        Acesso em: 29 maio 2024 (adaptado).
                        """
                ],
            ]
        ),
        Topic(
            title: "Desafios para o enfrentamento da invisibilidade do trabalho de cuidado realizado pela mulher no Brasil",
            source: "ENEM 2023",
            stimulusTexts: [
                [
                    "title": "TEXTO I",
                    "body":
                        """
                        O trabalho de cuidado não remunerado e mal pago e a crise global da desigualdade
                        
                        O trabalho de cuidado é essencial para nossas sociedades e para a economia. Ele inclui o trabalho de cuidar de crianças, idosos e pessoas com doenças e deficiências físicas e mentais, bem como o trabalho doméstico diário que inclui cozinhar, limpar, lavar, consertar coisas e buscar água e lenha. Se ninguém investisse tempo, esforços e recursos nessas tarefas diárias essenciais, comunidades, locais de trabalho e economias inteiras ficariam estagnados. Em todo o mundo, o trabalho de cuidado não remunerado e mal pago é desproporcionalmente assumido por mulheres e meninas em situação de pobreza, especialmente por aquelas que pertencem a grupos que, além da discriminação de gênero, sofrem preconceito em decorrência de sua raça, etnia, nacionalidade e sexualidade. As mulheres são responsáveis por mais de três quartos do cuidado não remunerado e compõem dois terços da força de trabalho envolvida em atividades de cuidado remuneradas.
                        """,
                    "source":
                        """
                        Documento Informativo — Tempo de Cuidar.
                        Disponível em: https://oxfam.org.br.
                        Acesso em: 18 de jul. de 2023 (adaptado).
                        """
                ],
                [
                    "title": "TEXTO II",
                    "body":
                        """
                        Média de horas dedicadas pelas pessoas de 14 anos ou mais de idade aos afazeres domésticos e/ou às tarefas de cuidado de pessoas, por sexo
                        
                        Brasil - 2019
                        | Sexo     | Horas Semanais |
                        |----------|----------------|
                        | Homens   | 11,0           |
                        | Mulheres | 21,4           |
                        
                        Fonte: IBGE - Pnad contínua anual
                        """,
                    "source":
                        """
                        Disponível em: https://agenciadenoticias.ibge.gov.br.
                        Acesso em: 18 de jul. 2023 (adaptado).
                        """
                ],
                [
                    "title": "TEXTO III",
                    "body":
                        """
                        A sociedade brasileira tem passado por inúmeras transformações sociais ao longo das últimas décadas. Entre elas, as percepções sociais a respeito dos valores e das convenções de gênero e a forma como mulheres têm se inserido na sociedade. Algumas permanências, porém, chamam a atenção, como a delegação quase que exclusiva às famílias – e, nestas, às mulheres – de atividades relacionadas à reprodução da vida e da sociedade, usualmente nominadas trabalho de cuidado.
                        """,
                    "source":
                        """
                        Disponível em: https://repositorio.ipea.gov.br.
                        Acesso em: 24 maio 2023 (adaptado).
                        """
                ],
                [
                    "title": "TEXTO IV (figura transcrita)",
                    "body":
                        """
                        Pesquisa
                        FAPESP
                        
                        JANEIRO DE 2021 | ANO 22, N. 299
                        DESAFIOS DO CUIDADO
                        
                        Aumenta o número de pessoas que demandam serviços de assistência, obrigando os países a repensar seus sistemas de atenção; no Brasil, protagonismo continua familiar
                        """,
                    "source":
                        """
                        Capa da revista Pesquisa.
                        Disponível em: https://revistapesquisa.fapesp.br.
                        Acesso em: 23 maio 2023 (adaptado).
                        """
                ],
            ]
        ),
        Topic(
            title: "Desafios para a valorização de comunidades e povos tradicionais no Brasil",
            source: "ENEM 2022",
            stimulusTexts: [
                [
                    "title": "TEXTO I",
                    "body":
                        """
                        Você sabe quais são as comunidades e os povos tradicionais brasileiros? Talvez indígenas e quilombolas sejam os primeiros que passam pela cabeça, mas, na verdade, além deles, existem 26 reconhecidos oficialmente e muitos outros que ainda não foram incluídos na legislação.
                        
                        São pescadores artesanais, quebradeiras de coco babaçu, apanhadores de flores sempre-vivas, caatingueiros, extrativistas, para citar alguns, todos considerados culturalmente diferenciados, capazes de se reconhecerem entre si.
                        
                        Para uma pesquisadora da UnB, essas populações consideram a terra como uma mãe, e há uma relação de reciprocidade com a natureza. Nessa troca, a natureza fornece "alimento, um lugar saudável para habitar, para ter água. E elas se responsabilizam por cuidar dela, por tirar dela apenas o suficiente para viver bem e respeitam o tempo de regeneração da própria natureza". diz.
                        """,
                    "source":
                        """
                        Disponível em: https://g1.globo.com.
                        Acesso em: 17 jun. 2022 (adaptado).
                        """
                ],
                [
                    "title": "TEXTO II (figura transcrita)",
                    "body":
                        """
                        Povos tradicionais do Brasil
                        Estados com a maior concentração de famílias
                        
                        Indígena
                        AM: 43.264
                        MS: 21.507
                        RR: 15.316
                        
                        Quilombola
                        BA: 43.009
                        MA: 39.316
                        PA: 15.282
                        
                        Cigano
                        BA: 1.538
                        GO: 643
                        MG: 556
                        
                        Extrativista
                        PA: 11.826
                        AM: 9.772
                        MA: 7.190
                        
                        Pescador
                        PA: 40.123
                        MA: 33.085
                        BA: 30.920
                        
                        Povos de terreiro
                        BA: 1.883
                        PI: 856
                        CE: 603
                        
                        Ribeirinho
                        PA: 50.314
                        AM: 16.507
                        BA: 9.670
                        
                        Fonte: Ministério Público Federal.
                        Infográfico elaborado em: 25/10/2019.
                        """,
                    "source":
                        """
                        Disponível em: https://g1.globo.com.
                        Acesso em: 17 jun. 2022 (adaptado).
                        """
                ],
                [
                    "title": "TEXTO III",
                    "body":
                        """
                        Povos e comunidades tradicionais
                        
                        O Ministério do Desenvolvimento Social (MDS) preside, desde 2007, a Comissão Nacional de Desenvolvimento Sustentável dos Povos e Comunidades Tradicionais (CNPCT), criada em 2006. Fruto dos trabalhos da CNPCT, foi instituída, por meio do Decreto nᴼ 6.040, de 7 de fevereiro de 2017, a Política Nacional de Desenvolvimento Sustentável dos Povos e Comunidades Tradicionais (PNPCT). A PNPCT foi criada em um contexto de busca de reconhecimento e preservação de outras formas de organização social por parte do Estado.
                        """,
                    "source":
                        """
                        Disponível em: http://mds.gov.br.
                        Acesso em: 17 jun. 2022 (adaptado).
                        """
                ],
                [
                    "title": "TEXTO IV",
                    "body":
                        """
                        Carta da Amazônia 2021
                        
                        Aos participantes da 26ª Conferência das Nações Unidas sobre Mudanças Climáticas (COP26)
                        
                        Não podia ser mais estratégico para nós, Povos Indígenas, Populações e Comunidades Tradicionais brasileiras, reafirmarmos a defesa da sociobiodiversidade amazônica neste momento em que o mundo se volta a debater a crise climática da COP26. Uma crise que atinge, em todos os contextos, os viventes da Terra!
                        
                        Nossos territórios protegidos e direitos respeitados são as reivindicações dos movimentos sociais e ambientais brasileiros.
                        
                        Não compactuamos com qualquer tentativa e estratégia baseada somente na lógica do mercado, com empresas que apoiam legislações ambientais que ameaçam nossos direitos e com mecanismos de financiamento que não condizem com a realidade dos nossos territórios.
                        
                        Propomos o que temos de melhor: a experiência das nossas sociedades e culturas históricas, construídas com base em nossos saberes tradicionais e ancestrais, além de nosso profundo conhecimento da natureza.
                        
                        Inovação, para nós, não pode resultar em processos que venham a ameaçar nossos territórios, nossas formas tradicionais e harmônicas de viver e produzir.
                        
                        Amazônia, Brasil, 20 de outubro de 2021.
                        
                        Entidades signatárias: CNS; Coiab; Conaq; MIQCB; Coica; ANA Amazônia e Confrem.
                        """,
                    "source":
                        """
                        Disponível em: https://s3.amazonaws.com.
                        Acesso em: 17 jun. 2022 (adaptado).
                        """
                ],
            ]
        ),
        Topic(
            title: "Invisibilidade e registro civil: garantia de acesso à cidadania no Brasil",
            source: "ENEM 2021",
            stimulusTexts: [
                [
                    "title": "TEXTO I",
                    "body":
                        """
                        Toda sexta-feira, o ônibus azul e branco estacionado no pátio da Vara da Infância e da Juventude, na Praça Onze, Centro do Rio, sacoleja com o entra e sai de gente a partir das 9h. Do lado de fora, nunca menos de 50 pessoas, todas pobres ou muito pobres, quase todas negras, cercam o veículo, perguntam, sentam e levantam, perguntam de novo e esperam sem reclamar o tempo que for preciso. Adultos, velhos e crianças estão ali para conseguir o que, no Brasil, é oficialmente reconhecido como o primeiro documento da vida - a certidão de nascimento. [...]
                        
                        Ao longo do discurso desses entrevistados, fica clara a forma como os usuários se definem: "zero à esquerda", "cachorro", "um nada", "pessoa que não existe", entre outras, todas são expressões que conformam claramente a ideia da pessoa sem registro de nascimento sobre si mesma como uma pessoa sem valor, cuja existência nunca foi oficialmente reconhecida pelo Estado.
                        """,
                    "source":
                        """
                        ESCÓSSIA, F. M. Invisíveis: uma etnografia sobre identidade, direitos e cidadania nas trajetórias de brasileiros sem documento. Tese (Doutorado em História, Política e Bens Culturais). Fundação Getúlio Vargas. Rio de Janeiro. 2019.
                        """
                ],
                [
                    "title": "TEXTO II (figura transcrita)",
                    "body":
                        """
                        A Lei Nº 9 534 de 1997 tornou o registro de nascimento gratuito no Brasil. Só que o problema persiste, mostrando que essa exclusão é complexa e não se explica apenas pela dificuldade financeira em pagar pelo registro, por exemplo.
                        
                        MAPA DA INVISIBILIDADE NO BRASIL
                        Estimativa do número de pessoas sem registro de nascimento
                        
                        Norte: 320 mil
                        Nordeste: 828 mil
                        Centro Oeste: 243 mil
                        Sudeste: 1,15 milhão
                        Sul: 399 mil
                        
                        Fonte: IBGE (Dados de 2015)
                        """,
                    "source":
                        """
                        Disponível em: https://estudio.r7.com/.
                        Acesso em: 22 jul. 2021 (adaptado).
                        """
                ],
                [
                    "title": "TEXTO III",
                    "body":
                        """
                        A certidão de nascimento é o primeiro e o mais importante documento do cidadão. Com ele, a pessoa existe oficialmente para o Estado e a sociedade. Só de posse da certidão é possível retirar outros documentos civis, como a carteira de trabalho, a carteira de identidade, o título de eleitor e o Cadastro de Pessoa Física (CPF). Além disso, para matricular uma criança na escola e ter acesso a benefícios sociais, a apresentação do documento é obrigatória.
                        """,
                    "source":
                        """
                        Disponivel em: http://www.senado.leg.br/.
                        Acesso em: 21 jul. 2021.
                        """
                ],
                [
                    "title": "TEXTO IV (figura transcrita)",
                    "body":
                        """
                        ONDE EXISTEM PESSOAS, NÓS ENXERGAMOS CIDADÃOS.
                        
                        DEFENSORAS E DEFENSORES PÚBLICOS PELO DIREITO À DOCUMENTAÇÃO PESSOAL.
                        """,
                    "source":
                        """
                        Disponível em: https:/www.ufrgs.br/humanista.
                        Acesso em: 26 jul. 2021 (adaptado).
                        """
                ],
            ]
        ),
        Topic(
            title: "O estigma associado às doenças mentais na sociedade brasileira",
            source: "ENEM 2020",
            stimulusTexts: [
                [
                    "title": "TEXTO I",
                    "body":
                        """
                        A maior parte das pessoas, quando houve falar em "saúde mental", pensa em "doença mental". Mas a saúde mental implica muito mais que a ausência de doenças mentais. Pessoas mentalmente saudáveis compreendem que ninguém é perfeito, que todos possuem limites e que não se pode ser tudo para todos. Elas vivenciam diariamente uma série de emoções como alegria, amor, satisfação, tristeza, raiva e frustração. São capazes de enfrentar os desafios e as mudanças da vida cotidiana com equilíbrio e sabem procurar ajuda quando têm dificuldade em lidar com conflitos, perturbações, traumas ou transições importantes nos diferentes ciclos da vida. A saúde mental de uma pessoa está relacionada à forma como ela reage às exigências da vida e ao modo como harmoniza seus desejos, capacidades, ambições, ideias e emoções. Todas as pessoas podem apresentar sinais de sofrimento psíquico em alguma fase da vida.
                        """,
                    "source":
                        """
                        Disponível em: http://www.saude.pr.gov.br.
                        Acesso em: 27 jul. 2020 (adaptado).
                        """
                ],
                [
                    "title": "TEXTO II",
                    "body":
                        """
                        A origem da palavra "estigma" aponta para marcas ou cicatrizes deixadas por feridas. Por extensão, em um período que remonta à Grécia Antiga, passou a designar também as marcas feitas com ferro em brasa em criminosos, escravos e outras pessoas que se desejava separar da sociedade "correta" e "honrada". Essa mesma palavra muitas vezes está presente no universo das doenças psiquiátricas. No lugar da marca de ferro, relegamos preconceito, falta de informação e tratamentos precários a pessoas que sofrem de depressão, ansiedade, transtorno bipolar e outros transtornos mentais graves.
                        
                        Achar que a manifestação de um transtorno mental é "frescura" está relacionado a um ideal de felicidade que não é igual para todo mundo. A tentativa de se encaixar nesse modelo cria distância dos sentimentos reais, e quem os demonstra é rotulado, o que progressivamente dificulta a interação social. É aqui que redes sociais de enorme popularidade mostram uma face cruel, desempenhando um papel de validação da vida perfeita e criando um ambiente em que tudo deve ser mostrado em seu melhor ângulo. Fora dos holofotes da internet, porém, transtornos mentais mostram-se mais presentes do que se imagina.
                        """,
                    "source":
                        """
                        http://www.abrata.org.br.
                        Acesso em: 27 jul. 2020 (adaptado).
                        """
                ],
                [
                    "title": "TEXTO III (figura transcrita)",
                    "body":
                        """
                        SOCORRO, BRASIL!
                        Saiba mais sobre o problema de saúde que afeta mais de 1 em cada 20 pessoas, mas que continuamos ignorando!
                        
                        Mais de 11,5 milhões de brasileiros têm depressão
                        
                        322 milhões de pessoas vivem com depressão em todo o mundo
                        
                        O Brasil é o país mais depressivo da América Latina
                        
                        Hoje A depressão é a doença mais incapacitante do mundo
                        
                        Depressão é a 2ᵃ causa de afastamento de trabalho no mundo
                        
                        1 trilhão de dólares é o valor da perda econômica mundial gerada pelas consequências dos transtornos mentais
                        
                        O número de mulheres afetadas pela depressão é 30% mais elevado que o dos homens
                        
                        Todos os dados foram divulgados pela Organização Mundial da Saúde (OMS) em fevereiro de 2017.
                        
                        Se você precisa de ajuda, ligue para o Centro de Valorização da Vida (CVV): 188
                        """,
                    "source":
                        """
                        Disponível em: https://zenklub.com.br.
                        Acesso em: 27 jul. 2020 (adaptado).
                        """
                ],
            ]
        ),
        Topic(
            title: "Democratização do acesso ao cinema no Brasil",
            source: "ENEM 2019",
            stimulusTexts: [
                [
                    "title": "TEXTO I",
                    "body":
                        """
                        No dia da primeira exibição pública de cinema — 28 de dezembro de 1895, em Paris —, um homem de teatro que trabalhava com mágicas, Georges Mélies, foi falar com Lumière, um dos inventores do cinema; queria adquirir um aparelho, e Lumière desencorajou-o, disse-lhe que o “Cinematógrapho” não tinha o menor futuro como espetáculo, era um instrumento científico para reproduzir o movimento e só poderia servir para pesquisas. Mesmo que o público, no início, se divertisse com ele, seria uma novidade de vida breve, logo cansaria. Lumière enganou-se. Como essa estranha máquina de austeros cientistas virou uma máquina de contar estórias para enormes plateias, de geração em geração, durante já quase um século?
                        """,
                    "source":
                        """
                        BERNARDET, Jean-Claude. O que é Cinema. In BERNARDET, Jean-Claude; ROSSI, Clóvis. O que é Jornalismo, O que é Editora, O que é Cinema. São Paulo: Brasiliense, 1993.
                        """
                ],
                [
                    "title": "TEXTO II",
                    "body":
                        """
                        Edgar Morin define o cinema como uma máquina que registra a existência e a restitui como tal, porém levando em consideração o indivíduo, ou seja, o cinema seria um meio de transpor para a tela o universo pessoal, solicitando a participação do espectador.
                        """,
                    "source":
                        """
                        GUTFREIND, C. F. O filme e a representação do real. E-Compós, v. 6, 11, 2006 (adaptado).
                        """
                ],
                [
                    "title": "TEXTO III (figura transcrita)",
                    "body":
                        """
                        DA TELONA PARA AS TELINHAS
                        
                        CRESCE O PERCENTUAL DE BRASILEIROS QUE FREQUENTAM SALAS DE CINEMA E O INTERESSE POR FILMES TEM DESTAQUE NA TV. ENTENDA!
                        
                        Nos últimos cinco anos, a penetração do cinema cresceu 43% entre os brasileiros
                        
                        88% dos telespectadores assistem a filmes na TV, regularmente
                        
                        17% da população frequenta o cinema*, no total
                        
                        19% dos telespectadores de filmes na TV vão ao cinema
                        
                        95% dos que foram ao cinema assistem a filmes na TV
                        
                        *assistiu nos últimos 30 dias
                        """,
                    "source":
                        """
                        Disponível em: www.meioemensagem.com.
                        Acesso em: 12 jun. 2019 (adaptado).
                        """
                ],
                [
                    "title": "TEXTO IV",
                    "body":
                        """
                        O Brasil já teve um parque exibidor vigoroso e descentralizado: quase 3 300 salas em 1975, uma para cada 30 000 habitantes, 80% em cidades do interior. Desde então, o país mudou. Quase 120 milhões de pessoas a mais passaram a viver nas cidades. A urbanização acelerada, a falta de investimentos em infraestrutura urbana, a baixa capitalização das empresas exibidoras, as mudanças tecnológicas, entre outros fatores, alteraram a geografia do cinema. Em 1997, chegamos a pouco mais de 1 000 salas. Com a expansão dos shopping centers, a atividade de exibição se reorganizou. O número de cinemas duplicou, até chegar às atuais 2 200 salas. Esse crescimento, porém, além de insuficiente (o Brasil é apenas o 60º país na relação habitantes por sala), ocorreu de forma concentrada. Foram privilegiadas as áreas de renda mais alta das grandes cidades. Populações inteiras foram excluídas do universo do cinema ou continuam mal atendidas: o Norte e o Nordeste, as periferias urbanas, as cidades pequenas e médias do interior.
                        """,
                    "source":
                        """
                        Disponível em: https://cinemapertodevoce.ancine.gov.br.
                        Acesso em: 13 jun. 2019 (fragmento).
                        """
                ],
            ]
        ),
        Topic(
            title: "Manipulação do comportamento do usuário pelo controle de dados na internet",
            source: "ENEM 2018",
            stimulusTexts: [
                [
                    "title": "TEXTO I",
                    "body":
                        """
                        Às segundas-feiras pela manhã, os usuários de um serviço de música digital recebem uma lista personalizada de músicas que lhes permite descobrir novidades. Assim como os sistemas de outros aplicativos e redes sociais, este cérebro artificial consegue traçar um retrato automatizado do gosto de seus assinantes e constrói uma máquina de sugestões que não costuma falhar.
                        O sistema se baseia em um algoritmo cuja evolução e usos aplicados ao consumo cultural são infinitos. De fato, plataformas de streaming de vídeo on-line começam a desenhar suas séries de sucesso rastreando o banco de dados gerado por todos os movimentos dos usuários para analisar o que os satisfaz.
                        O algoritmo constrói assim um universo cultural adequado e complacente com o gosto do consumidor, que pode avançar até chegar sempre a lugares reconhecíveis. Dessa forma, a filtragem de informação feita pelas redes sociais ou pelos sistemas de busca pode moldar nossa maneira de pensar. E esse é o problema principal, a ilusão de liberdade de escolha que muitas vezes é gerada pelos algoritmos.
                        """,
                    "source":
                        """
                        VERDÚ, Daniel. O Gosto na era do algoritimo.
                        Disponível em https://brasil.elpais.com.
                        Acesso em: 11 de jun. 2018 (adaptado).
                        """
                ],
                [
                    "title": "TEXTO II",
                    "body":
                        """
                        Nos sistemas dos gigantes da internet, a filtragem de dados é transferida para um exército de moderadores em empresas localizadas do Oriente Médio ao Sul da Ásia, que têm um papel no controle daquilo que deve ser eliminado da rede social, a partir de sinalizações dos usuários. Mas a informação é então processada por um algoritmo, que tem a decisão final. Os algoritmos são literais. Em poucas palavras, são uma opinião embrulhada em código. E estamos caminhando para um estágio em que é a máquina decide qual notícia deve ou não ser lida.
                        """,
                    "source":
                        """
                        PEPE ESCOBAR. A silenciosa ditadura do algoritmo.
                        Disponível em http://outraspalavras.net.
                        Acesso em: 5 jun. 2017 (adaptado).
                        """
                ],
                [
                    "title": "TEXTO III (figura transcrita)",
                    "body":
                        """
                        Utilização da Internet
                        
                        64,7% das pessoas de 10 anos ou mais de idade utilizaram a internet.
                        Homens: 63,8%
                        Mulheres: 65,5%
                        
                        Cerca de 85% dos jovens de 18 a 24 anos de idade e 25% das pessoas de 60 anos ou mais de idade utilizaram a internet.
                        
                        Finalidade do acesso à Internet (%)
                        94,2: Enviar ou receber mensagens de texto, voz ou imagens por aplicativos diferentes de e-mail
                        
                        76,4: Assistir a vídeos, inclusive programas, séries e filmes
                        
                        73,3: Conversar por chamada de voz ou vídeo
                        
                        69,3: Enviar ou receber e-mails (correio eletrônico)
                        """,
                    "source":
                        """
                        Internet no Brasil em 2016.
                        Disponível em: www.ibge.gov.br.
                        Acesso em: 18 jun. 2018 (adaptado).
                        """
                ],
                [
                    "title": "TEXTO IV",
                    "body":
                        """
                        Mudanças sutis nas informações às quais somos expostos podem transformar nosso comportamento. A redes têm selecionado as notícias sob títulos chamativos como “trending topics” ou critérios como “relevância”. Mas nós praticamente não sabemos como isso tudo é filtrado. Quanto mais informações relevantes tivermos nas pontas dos dedos, melhor equipados estamos para tomar decisões. No entanto, surgem algumas tensões fundamentais: entre a conveniência e a deliberação; entre o que o usuário deseja e o que é melhor para ele; entre a transparência e o lado comercial.
                        
                        Quanto mais os “sistemas” souberem sobre você em comparação ao que você sabe sobre eles, há mais riscos de suas escolhas se tornarem apenas uma série de reações a “cutucadas” invisíveis. O que está em jogo não é tanto a questão “homem versus máquina”, mas sim a disputa “decisão informada versus obediência influenciada”.
                        """,
                    "source":
                        """
                        CHATFIELD, Tom. Como a internet influencia secretamente nossas escolhas. 
                        Disponível em www.bbc.com.
                        Acesso em: 3 jun. 2017 (adaptado).
                        """
                ],
            ]
        ),
        Topic(
            title: "Desafios para a formação educacional de surdos no Brasil",
            source: "ENEM 2017",
            stimulusTexts: [
                [
                    "title": "TEXTO I",
                    "body":
                        """
                        CAPÍTULO IV - DO DIREITO À EDUCAÇÃO
                        
                        Art. 27. A educação constitui direito da pessoa com deficiência, assegurados sistema educacional inclusivo em todos os níveis e aprendizado ao longo de toda a vida, de forma a alcançar o máximo desenvolvimento possível de seus talentos e habilidades físicas, sensoriais, intelectuais e sociais, segundo suas características, interesses e necessidades de aprendizagem.
                        
                        Parágrafo único.  É dever do Estado, da família, da comunidade escolar e da sociedade assegurar educação de qualidade à pessoa com deficiência, colocando-a a salvo de toda forma de violência, negligência e discriminação.
                        
                        Art. 28. Incumbe ao poder público assegurar, criar, desenvolver, implementar, incentivar, acompanhar e avaliar: [...]
                        
                        IV – oferta de educação bilíngue, em Libras como primeira língua e na modalidade escrita da língua portuguesa como segunda língua, em escolas e classes bilíngues e em escolas inclusivas; [...]
                        
                        XII – oferta de ensino da Libras, do Sistema Braille e de uso de recursos de tecnologia assistiva, de forma a ampliar habilidades funcionais dos estudantes, promovendo sua autonomia e participação.
                        """,
                    "source":
                        """
                        BRASIL. Lei nº 13.146, de 6 de julho de 2015.
                        Disponível em: www.planalto.gov.br
                        Acesso em: 9 jun. 2017 (fragmento).
                        """
                ],
                [ // FIXME: missing transcription
                    "title": "TEXTO II (figura transcrita)",
                    "body":
                        """
                        
                        """,
                    "source":
                        """
                        Fonte: Inep.
                        """
                ],
                [
                    "title": "TEXTO III (figura transcrita)",
                    "body":
                        """
                        SOU SURDO
                        E PÓS GRADUADO EM MARKETING.
                        
                        E NA SUA EMPRESA,
                        TEM ESPAÇO PARA MIM?
                        
                        TRABALHO NÃO TOLERA PRECONCEITO.
                        VALORIZE AS DIFERENÇAS.
                        """,
                    "source":
                        """
                        Disponível em: http://servicos.prt4.mpt.mp.br.
                        Acesso em: 3 jun. 2017 (adaptado).
                        """
                ],
                [
                    "title": "TEXTO IV",
                    "body":
                        """
                        No Brasil, os surdos só começaram a ter acesso à educação durante o Império, no governo de Dom Pedro II, que criou a primeira escola de educação de meninos surdos, em 26 de setembro de 1857, na antiga capital do País, o Rio de Janeiro. Hoje, no lugar da escola funciona o Instituto Nacional de Educação de Surdos (Ines). Por isso, a data foi escolhida como Dia do Surdo.
                        
                        Contudo, foi somente em 2002, por meio da sanção da Lei n° 10.436, que a Língua Brasileira de Sinais (Libras) foi reconhecida como meio legal de comunicação e expressão no País. A legislação determinou também que deve ser garantido, por parte do poder público em geral e empresas concessionárias de serviços públicos, formas institucionalizadas de apoiar o uso e difusão de Libras como meio de comunicação objetiva.
                        """,
                    "source":
                        """
                        Disponível em: www.brasil.gov.br
                        Acesso em: 9 jun. 2017 (adaptado).
                        """
                ],
            ]
        ),
        Topic(
            title: "Caminhos para combater a intolerância religiosa no Brasil",
            source: "ENEM 2016",
            stimulusTexts: [
                [
                    "title": "TEXTO I",
                    "body":
                        """
                        Em consonância com a Constituição da República Federativa do Brasil e com toda a legislação que assegura a liberdade de crença religiosa às pessoas, além de proteção e respeito às manifestações religiosas, a laicidade do Estado deve ser buscada, afastando a possibilidade de interferência de correntes religiosas em matérias sociais, políticas, culturais etc.
                        """,
                    "source":
                        """
                        Disponível em: www.mprj.mp.br.
                        Acesso em: 21 maio 2016 (fragmento).
                        """
                ],
                [
                    "title": "TEXTO II",
                    "body":
                        """
                        O direito de criticar dogmas e encaminhamentos é assegurado como liberdade de expressão, mas atitudes agressivas, ofensas e tratamento diferenciado a alguém em função de crença ou de não ter religião são crimes inafiançáveis e imprescritíveis.
                        """,
                    "source":
                        """
                        STECK, J. Intolerância religiosa é crime de ódio e fere a dignidade. Jornal do Senado.
                        Acesso em: 21 maio 2016 (fragmento).
                        """
                ],
                [
                    "title": "TEXTO III",
                    "body":
                        """
                        CAPÍTULO I
                        
                        Dos Crimes Contra o Sentimento Religioso
                        
                        Ultraje a culto e impedimento ou perturbação de ato a ele relativo
                        
                        Art. 208 - Escarnecer de alguém publicamente, por motivo de crença ou função religiosa; impedir ou perturbar cerimônia ou prática de culto religioso; vilipendiar publicamente ato ou objeto de culto religioso:
                        
                        Pena - detenção, de um mês a um ano, ou multa.
                        
                        Parágrafo único - Se há emprego de violência, a pena é aumentada de um terço, sem prejuízo da correspondente à violência.
                        """,
                    "source":
                        """
                        BRASIL. Código Penal.
                        Disponível em: www.planalto.gov.br.
                        Acesso em: 21 maio 2016 (fragmento).
                        """
                ],
                [
                    "title": "TEXTO IV (figura transcrita)",
                    "body":
                        """
                        Intolerância Religiosa no Brasil
                        Fiéis de religiões afro-brasileiras são as principais vítimas de discriminação
                        
                        Número de denúncias por religião (2011 a 2014*)
                        
                        Afro-brasileira: 75
                        Evangélica: 58
                        Espírita: 27
                        Católica: 22
                        Ateus: 8
                        Judaica: 6
                        Islâmica: 5
                        Outras: 15
                        * Até jul. 2014
                        
                        1 denúncia a cada 3 dias
                        213 denúncias com religião não informada
                        20% dos episódios relatados em 2013 envolveram violência física
                        12% dos episódios relatados até jul. 2014 envolveram violência física
                        
                        Fonte: Secretaria de Direitos Humanos da Presidência da República
                        """,
                    "source":
                        """
                        Disponivel em: www1.folha.uol.com.br.
                        Acesso em: 31 maio 2016 (adaptado).
                        """
                ],
            ]
        ),
        Topic(
            title: "A persistência da violência contra a mulher na sociedade brasileira",
            source: "ENEM 2015",
            stimulusTexts: [
                [
                    "title": "TEXTO I",
                    "body":
                        """
                        Nos 30 anos decorridos entre 1980 e 2010 foram assassinadas no país acima de 92 mil mulheres, 43,7 mil só na última década. O número de mortes nesse período passou de 1.353 para 4.465, que representa um aumento de 230%, mais que triplicando o quantitativo de mulheres vítimas de assassinato no país.
                        """,
                    "source":
                        """
                        WALSELFISZ, J. J. Mapa da Violência 2012. Atualização: Homicídio de mulheres no Brasil.
                        Disponível em: www.mapadaviolencia.org.br.
                        Acesso em: 8 jun. 2015.
                        """
                ],
                [
                    "title": "TEXTO II (figura transcrita)",
                    "body":
                        """
                        TIPO DE VIOLÊNCIA RELATADA
                        
                        A - Violência física: 51,68%
                        B - Violência psicológica: 31,81%
                        C - Violência moral: 9,68%
                        D - Violência sexual: 2,86%
                        E - Violência patrimonial: 1,94%
                        F - Cárcere privado: 1,76%
                        G - Tráfico de pessoas: 0,26%
                        """,
                    "source":
                        """
                        BRASIL. Secretaria de Políticas para as Mulheres. Balanço 2014. Central de Atendimento à Mulher: Disque 180. Brasília, 2015.
                        Disponível em: www.spm.gov.br.
                        Acesso em: 24 jun. 2015 (adaptado)
                        """
                ],
                [
                    "title": "TEXTO III (figura transcrita)",
                    "body":
                        """
                        FEMINICÍDIO
                        
                        BASTA
                        """,
                    "source":
                        """
                        Disponível em: www.compromissoeatitude.org.br.
                        Acesso em: 24 jun. 2015 (adaptado).
                        """
                ],
                [
                    "title": "TEXTO IV (figura transcrita)",
                    "body":
                        """
                        O IMPACTO EM NÚMEROS
                        
                        Com base na Lei Maria da Penha, mais de 330 mil processos foram instaurados apenas nos juizados e varas especializados
                        
                        332.216 processos que envolvem a Lei Maria da Penha chegaram, entre setembro de 2006 e março de 2011, aos 52 juizados e varas especializados em Violência Doméstica e Familiar contra a Mulher existentes no País. O que resultou em:
                        
                        33,4% de processos julgados
                        9.715 prisões em flagrante
                        1.577 prisões preventivas decretadas
                        
                        58 mulheres e 2.777 homens enquadrados na Lei Maria da Penha estavam presos no País em dezembro de 2010. Ceará, Rio de Janeiro e Rio Grande do Sul não constam desse levantamento feito pelo Departamento Penitenciário Nacional
                        
                        237 mil relatos de violência foram feitos ao Ligue 180, serviço telefônico da Secretaria de Políticas para as Mulheres
                        
                        Sete de cada dez vitimas que telefonaram para o Ligue 180 afirmaram ter sido agredidas pelos companheiros
                        
                        Fontes: Conselho Nacional de Justiça, Departamento Penitenciário Nacional e Secretaria de Políticas para as Mulheres
                        """,
                    "source":
                        """
                        Disponível em: www.istoe.com.br.
                        Acesso em: 24 jun. 2015 (adaptado).
                        """
                ],
            ]
        ),
        Topic(
            title: "Publicidade infantil em questão no Brasil",
            source: "ENEM 2014",
            stimulusTexts: [
                [
                    "title": "TEXTO I",
                    "body":
                        """
                        A aprovação, em abril de 2014, de uma resolução que considera abusiva a publicidade infantil, emitida pelo Conselho Nacional de Direitos da Criança e do Adolescente (Conanda), deu início a um verdadeiro cabo de guerra envolvendo ONGs de defesa dos direitos das crianças e setores interessados na continuidade das propagandas dirigidas a esse público.
                        
                        Elogiada por pais, ativistas e entidades, a resolução estabelece como abusiva toda propaganda dirigida à criança que tem “a intenção de persuadi-la para o consumo de qualquer produto ou serviço” e que utilize aspectos como desenhos animados, bonecos, linguagem infantil, trilhas sonoras com temas infantis, oferta de prêmios, brindes ou artigos colecionáveis que tenham apelo às crianças.
                        
                        Ainda há dúvidas, porém, sobre como será a aplicação prática da resolução. E associações de anunciantes, emissoras, revistas e de empresas de licenciamento e fabricantes de produtos infantis criticam a medida e dizem não reconhecer a legitimidade constitucional do Conanda para legislar sobre publicidade e para impor a resolução tanto às famílias quanto ao mercado publicitário. Além disso, defendem que a autorregulamentação pelo Conselho Nacional de Autorregulamentação Publicitária (Conar) já seria uma forma de controlar e evitar abusos.
                        """,
                    "source":
                        """
                        IDOETA, P. A.; BARBA, M. D. A publicidade infantil deve ser proibida?
                        Disponível em: www.bbc.co.uk.
                        Acesso em: 23 maio 2014 (adaptado).
                        """
                ],
                [
                    "title": "TEXTO II (figura transcrita)",
                    "body":
                        """
                        A PUBLICIDADE PARA CRIANÇAS NO MUNDO
                        
                        QUÉBEC (Canadá):
                        Proibido
                        
                        ESTADOS UNIDOS:
                        Autorregulamentação
                        
                        REINO UNIDO:
                        Proibição parcial; Personagens
                        
                        IRLANDA:
                        Proibição parcial
                        
                        FRANÇA:
                        Alerta
                        
                        ITÁLIA:
                        Proibição parcial
                        
                        BRASIL:
                        Autorregulamentação
                        
                        CHILE:
                        Proibição parcial; Alerta
                        
                        NORUEGA:
                        Proibido
                        
                        SUÉCIA:
                        Proibição parcial, Personagens
                        
                        DINAMARCA:
                        Proibição parcial
                        
                        BÉLGICA:
                        Proibição parcial
                        
                        COREIA DO SUL:
                        Proibição parcial
                        
                        AUSTRÁLIA:
                        Autorregulamentação
                        
                        Autorregulamentação: Não há leis nacionais, o setor cria normas e faz acordos com o governo
                        
                        Alerta: Mensagens recomendam consumo moderado e alimentação saudável
                        
                        Proibição parcial: Comerciais são proibidos em certos horários ou para determinadas faixas etárias
                        
                        Personagens: Famosos e personagens de desenhos não podem aparecer em anúncios de alimentos infantis
                        
                        Proibido: Não é permitido nenhum tipo de publicidade para crianças
                        
                        Fontes: OMS e Conar/2013
                        """,
                    "source":
                        """
                        Disponível em: www1.folha.uol.com.br.
                        Acesso em: 24 jun. 2014 (adaptado).
                        """
                ],
                [
                    "title": "TEXTO III",
                    "body":
                        """
                        Precisamos preparar a criança, desde pequena, para receber as informações do mundo exterior, para compreender o que está por trás da divulgação de produtos. Só assim ela se tornará o consumidor do futuro, aquele capaz de saber o que, como e por que comprar, ciente de suas reais necessidades e consciente de suas responsabilidades consigo mesma e com o mundo.
                        """,
                    "source":
                        """
                        SILVA, A. M. D.; VASCONCELOS, L. R. A criança e o marketing: informações essenciais para proteger as crianças dos apelos do marketing infantil. São Paulo: Summus, 2012 (adaptado).
                        """
                ],
            ]
        ),
//        Topic(
//            title: "Efeitos da implantação da Lei Seca no Brasil",
//            source: "ENEM 2013",
//            stimulusTexts: [
//                
//            ]
//        ),
//        Topic(
//            title: "Movimento imigratório para o Brasil no século 21",
//            source: "ENEM 2012",
//            stimulusTexts: [
//                
//            ]
//        ),
//        Topic(
//            title: "Viver em rede no século 21: os limites entre o público e o privado",
//            source: "ENEM 2011",
//            stimulusTexts: [
//                
//            ]
//        ),
//        Topic(
//            title: "O trabalho na construção da dignidade humana",
//            source: "ENEM 2010",
//            stimulusTexts: [
//                
//            ]
//        ),
    ]
}
