-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2022 at 10:02 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `loja_manga`
--

-- --------------------------------------------------------

--
-- Table structure for table `compras`
--

CREATE TABLE `compras` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `valor_total` double(9,2) NOT NULL,
  `status` varchar(40) NOT NULL,
  `data_status` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `data_compra` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `compras`
--

INSERT INTO `compras` (`id`, `id_cliente`, `valor_total`, `status`, `data_status`, `data_compra`) VALUES
(79, 4, 29.90, 'Seu pedido chegou!', '2022-12-05 20:21:13', '2022-12-05 16:02:57');

-- --------------------------------------------------------

--
-- Table structure for table `compras_produtos`
--

CREATE TABLE `compras_produtos` (
  `id` int(11) NOT NULL,
  `id_produto` int(10) NOT NULL,
  `id_compra` int(10) NOT NULL,
  `quantidade` int(10) NOT NULL,
  `valor_unitario` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `compras_produtos`
--

INSERT INTO `compras_produtos` (`id`, `id_produto`, `id_compra`, `quantidade`, `valor_unitario`) VALUES
(34, 10, 79, 1, '29.90');

-- --------------------------------------------------------

--
-- Table structure for table `lista_favoritos`
--

CREATE TABLE `lista_favoritos` (
  `id` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `produtos`
--

CREATE TABLE `produtos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `autor` varchar(100) NOT NULL,
  `descricao` longtext NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `imagem` varchar(140) NOT NULL,
  `estoque` int(11) NOT NULL,
  `categoria` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produtos`
--

INSERT INTO `produtos` (`id`, `nome`, `autor`, `descricao`, `valor`, `data_cadastro`, `imagem`, `estoque`, `categoria`) VALUES
(1, 'One Piece Vol. 100', 'Eichiiro Oda', 'Com todas as estrelas reunidas no topo da fortaleza, Luffy e os Piratas da Nova Gera????o desafiam Kaido e Big Mom! Ser?? que h?? alguma chance de vit??ria contra essa alian??a formada entre os dois mais poderosos piratas dos mares?! O que o futuro reserva para essa batalha extrema que est?? fazendo toda Onigashima tremer?!\r\n', '79.00', '2022-11-18 19:25:26', 'upload/op100.jpg', 99, 'destaque'),
(2, 'One Piece Vol. 101', 'Eichiiro Oda', 'Acreditando que Luffy voltar?? e n??o desistir?? de derrubar Kaido, seus companheiros travam batalhas mortais e intensas contra os Oficiais do bando inimigo!! Enquanto isso, ?? no topo de Onigashima que Kaido e Yamato est??o frente a frente dando in??cio a um confronto fat??dico entre pai e filha!!', '70.00', '2022-11-18 19:34:10', 'upload/op101.jpg', 0, 'destaque'),
(4, 'One Piece Vol. 98\r\n', 'Eichiiro Oda', 'Durante a batalha decisiva em Onigashima, que esquenta cada vez mais, Yamato, a filha de Kaido, surge diante de Luffy querendo lutar ao seu lado! Enquanto isso, Kaido revela em detalhes o \"Plano da Nova Onigashima\" e, junto de Big Mom, est?? prestes a mergulhar o mundo inteiro em caos!!', '50.00', '2022-11-18 20:07:11', 'upload/op98.jpg', 4, 'destaque'),
(8, 'Berserk Vol. 1', '', 'O misterioso Guts, o \"Espadachim Negro\", carrega em sua m??o mec??nica uma enorme espada, e em seu pesco??o uma estranha marca que atrai for??as demon??acas. Em sua busca por vingan??a contra um antigo inimigo, nem tudo sai a seu favor, e ele recebe ajuda de uma fant??stica criatura.', '34.90', '2022-11-22 11:54:23', 'upload/637ce29fe1f9b.jpg', 4, 'lancamento'),
(9, 'Boku no Hero Vol. 29', '', 'Tudo ao redor do gigante est?? destru??do! \"Devo ir at?? meu mestre\", e pera??, at?? o Shigaraki?! Nem pensar! Se ele chegar na cidade, n??o vai sobrar nada de p??! E os estudantes da U.A. tamb??m est??o em perigo! O que est?? acontecendo no Hospital Jaku?! Mas que saco, paaaraaaaa!! ???Plus Ultra???!!', '29.90', '2022-11-22 12:23:24', 'upload/637ce96c533e2.jpg', 2, 'lancamento'),
(10, 'Boku no Hero Vol. 30', '', 'Ei, ei, por que as coisas ficaram assim?! O vil??o colossal t?? avan??ando cada vez mais, e ele n??o para de destruir tudo! Tenho que reportar a situa????o... Todos est??o lutando com toda sua for??a! Tenho que proteger todas as pessoas que puder! Eu preciso passar pra frente o sentimento dos meus amigos que ca??ram! ???Plus Ultra???!!\r\n', '29.90', '2022-11-22 12:26:57', 'upload/637cea41216d6.jpg', 0, 'lancamento'),
(37, 'One Piece Vol. 99', 'Eichiiro Oda', 'Depois de seus companheiros conseguirem impedir a persegui????o implac??vel dos Oficiais dos Piratas Bestiais, Luffy finalmente chega ao topo da fortaleza e est?? diante de Kaido!! Todos os atores re??nem-se neste palco grandioso onde um combate mais do que intenso est?? prestes a come??ar...! ?? o in??cio do cl??max da batalha final em Onigashima!!', '59.90', '2022-11-22 14:01:53', 'upload/637d0081e40a5.jpg', 4, 'destaque'),
(38, 'Haikyu - Volume 2', '', 'Shoyo Hinata quer provar que no v??lei voc?? n??o precisa ser alto para voar!Desde que viu o lend??rio jogador conhecido como \"o Pequeno Gigante\" competir nas finais nacionais de voleibol, Shoyo Hinata almeja ser o melhor jogador de voleibol de todos os tempos! Quem disse que voc?? precisa ser alto para jogar v??lei quando pode pular mais alto do que qualquer outra pessoa?Depois de provar ser a melhor combina????o em sua partida de treino contra Kei Tsukishima, Kageyama e Hinata finalmente podem entrar no clube! O verdadeiro poder de Hinata - para cronometrar perfeitamente seus picos com os olhos fechados - ?? despertado, e nada pode parar esta dupla louca setter-spiker. Agora suas habilidades est??o prestes a ser postas ?? prova em um jogo pr??tico contra um dos ex-companheiros de equipe de Kageyama do ensino m??dio, Tohru Oikawa.', '40.00', '2022-11-28 19:31:31', 'upload/638536c3c0c06.jpg', 3, 'lancamento'),
(40, 'Bleach, Vol. 19', 'Tite Kubo', 'Part-time student, full-time Soul Reaper, Ichigo is one of the chosen few guardians of the afterlife.\r\nIchigo Kurosaki never asked for the ability to see ghosts--he was born with the gift. When his family is attacked by a Hollow--a malevolent lost soul--Ichigo becomes a Soul Reaper, dedicating his life to protecting the innocent and helping the tortured spirits themselves find peace. Find out why Tite Kubo\'s Bleach has become an international manga smash-hit!\r\n\r\nThe long-awaited showdown between Ichigo and Byakuya Kuchiki has finally begun. Has Ichigo succeeded in mastering bankai, the highest level of power that a Soul Reaper can attain, to face Byakuya as an equal?', '39.90', '2022-11-29 17:50:14', 'upload/6386708638f65.png', 9, 'destaque'),
(42, 'One-Punch Man 01', 'One', 'Com apenas um soco!! Saitama se tornou forte a ponto de derrotar criaturas monstruosas com um ??nico soco.\r\nE o que n??o falta s??o monstros para serem derrotados na Cidade Z, onde eles surgem a todo momento, seja das profundezas da Terra ou dos confins do espa??o, como resultado de uma experi??ncia maluca ou de uma muta????o gen??tica.\r\nO problema ?? justamente que ele os derrota com um golpe s??!\r\nobjetivo agora ?? encontrar a emo????o de um verdadeiro desafio! A lenda do mais poderoso e pacato her??i come??a aqui!!', '22.90', '2022-11-29 18:04:02', 'upload/638673c288dc7.png', 4, 'destaque'),
(81, 'Berserk Vol. 1: Edi????o de Luxo', 'Kentaro Miura', 'O misterioso Guts, o \"Espadachim Negro\", carrega em sua m??o mec??nica uma enorme espada, e em seu pesco??o uma estranha marca que atrai for??as demon??acas. Em sua busca por vingan??a contra um antigo inimigo, nem tudo sai a seu favor, e ele recebe ajuda de uma fant??stica criatura', '27.48', '2022-12-05 15:07:15', 'upload/638e335357163.png', 30, 'pre-venda'),
(82, 'Berserk Vol. 2: Edi????o de Luxo: 02', 'Kentaro Miura', 'Guts se depara com o Behelit, uma misteriosa pedra que pode invocar os God Hand, os terr??veis senhores da escurid??o, que ele deseja encontrar para completar sua vingan??a. Mas o Conde, senhor do feudo e tirano que amea??a o povo com a \"ca??a aos hereges\", tamb??m parece ter rela????o com a pedra e os God Hand. Guts declara guerra ao Conde e invade seu castelo, deixando um rastro de sangue por onde passa.', '24.90', '2022-12-05 15:08:51', 'upload/638e33b38c77f.png', 20, 'pre-venda'),
(83, 'Berserk Vol. 3: Edi????o de Luxo: 03', 'Kentaro Miura', 'A batalha contra o Conde continua e se encaminha para um final inesperado. O despertar do Behelit acarreta a apari????o dos God Hand, e entre eles est?? Griffith, que invoca a ira de Guts por lembran??as de seu passado! Qual ser?? a rela????o entre eles?', '27.90', '2022-12-05 15:10:55', 'upload/638e342f2bc5a.png', 20, 'pre-venda'),
(84, 'Black Clover - 24', 'Y??ki Tabata', 'O reino Spade come??a a invadir tanto o reino de Clover quanto o reino Heart. Asta e seu grupo se desenvolvem com o treinamento dos lordes espirituais e partem para enfrentar as tropas de Spade, que ostentam o poder demon??aco e violam as pessoas!! Distante de tudo isso, uma pessoa que sabe o segredo de seu nascimento aparece diante de Yuno. Qual ?? a liga????o com o reino Spade que estava oculta nesse passado?!', '28.80', '2022-12-05 15:12:41', 'upload/638e349984d29.png', 25, 'destaque'),
(85, 'Spy X Family Vol. 2', 'Tatsuya Endo', 'Com a miss??o de proteger a paz entre Ostania e Westalis, a fam??lia Forger encara o desafio do Exame de Admiss??o de um renomado col??gio. Por??m, para se aproximar de Desmond, o alvo, Anya precisa se tornar uma Aluna Excelente!! Twilight ent??o p??e em pr??tica o \"Plano da Amizade\"...?!', '34.90', '2022-12-05 15:14:22', 'upload/638e34feb300b.png', 20, 'destaque'),
(86, 'Chainsaw Man Vol. 11', 'Tatsuki Fujim', 'O controle cruel e impiedoso de Makima segue perseguindo Denji! Mas ?? durante sua afli????o por ter perdido in??meras coisas e a sensa????o de ter seu cora????o afundado num vaso entupido de merda que Denji ouve os gritos de ???Chainsaw Man??? ecoando pelo mundo...!!Assim, Denji e Makima rumam para um campo sangrento prontos para o confronto final! ?? na conclus??o desses sentimentos n??o correspondidos que esta s??rie chega ao seu fim chocante e explosivo!!', '33.90', '2022-12-05 15:17:49', 'upload/638e35cd4831b.png', 0, 'pre-venda'),
(87, 'Jujutsu Kaisen: Batalha de Feiticeiros Vol. 20', 'Gege Akutami ', 'Fushiguro e Reggie est??o prestes a serem esmagados at?? a morte por seus respectivos feiti??os. Para vencer, Reggie entra em a????o e o duelo mortal se aproxima do fim!! Enquanto isso, na Col??nia de Sendai, Okkotsu destr??i o dom??nio dos quatro jogadores mais poderosos, engajando-se em uma luta feroz contra feiticeiros Jujutsu do passado e um esp??rito amaldi??oado de n??vel especial!', '36.90', '2022-12-05 15:19:32', 'upload/638e3634e702f.png', 30, 'pre-venda'),
(88, 'One Piece 3 em 1 Vol. 9 ', 'Eiichiro Oda', 'Em busca de mais pistas sobre a Ilha do C??u, o Bando do Chap??u de Palha procura um recluso contador de hist??rias e acaba se envolvendo em um problem??o!Ap??s conseguir chegar ao t??o desejado destino, Luffy e seus companheiros s??o perseguidos pelos Guardas de Deus, a pol??cia de Skypiea, e os habitantes por terem entrado de forma ilegal no local. Agora, a ??nica forma de sa??rem dessa situa????o ?? passar por diversos desafios propostos pelos subordinados de Deus.Como ser?? que o Bando vai lidar com esse obst??culo?! Nesse ??nterim, Nico Robin faz uma incr??vel descoberta sobre a ilha!', '84.90', '2022-12-05 15:22:41', 'upload/638e36f1d3ce4.png', 0, 'pre-venda'),
(89, 'Dragon Ball Super Vol. 19', 'Akira Toriyama', 'Gas parece acuado com o feroz ataque de Granola, mas libera o seu instinto e desperta. Goku e seus amigos ficam impressionados com esse grande poder. Parece que a chave para derrotar Gas est?? nas lembran??as do falecido pai do Goku, Bardock...', '37.90', '2022-12-05 15:28:47', 'upload/638e385f4e675.png', 19, 'pre-venda'),
(90, 'Chainsaw Man Vol. 10', 'Tatsuki Fujimoto', '???Eu matei o Aki...???Denji est?? desesperado e com a cabe??a nos ares, ent??o, resolve pedir ajuda ?? Makima.  Entretanto, o consolo tempor??rio fornecido por ela n??o passou do prel??dio de um pesadelo ainda pior... Quando a porta proibida na mente de Denji se abre, as verdadeiras inten????es de Makima e o segredo do Dem??nio da Motosserra se cruzam transformando tudo em um inferno sangrento!!', '28.80', '2022-12-05 15:38:14', 'upload/638e3a96ac140.png', 50, 'lancamento'),
(91, 'Tokyo Revengers - Vol. 03', 'Ken Wakui', 'Um salto no tempo de 12 anos no passado d?? ao jovem Takemichi a oportunidade de salvar sua ex-namorada, v??tima das regras de contas de uma gangue chamada Tokyo Manji-kai. S?? que, enquanto ele tenta argumentar com Mikey para parar a guerra contra o cl?? Moebius e a divis??o do Tokyo Manji-kai, ele cai em uma emboscada! Surpreso com as consequ??ncias inesperadas das interven????es, ele conseguir?? impedir que a l??mina do destino caia sobre Draken?!', '27.10', '2022-12-05 15:40:02', 'upload/638e3b024a8a6.png', 40, 'lancamento'),
(92, 'Tokyo Revengers - Vol. 04', 'Ken Wakui', 'A sangrenta batalha de Halloween come??a com dois confrontos repentinos e violentos entre os pesos pesados ??????de ambas as gangues: Mikey contra Kazutora e Draken contra Hanma. Testemunhando a situa????o horr??vel que se desenrola diante de seus olhos, Takemichi teme que Mikey acabe matando Kazutora, o que o levaria de volta ao futuro horr??vel que ele j?? conhece. Mikey cair?? na escurid??o depois que o sangrento Halloween terminar?', '27.10', '2022-12-05 15:40:35', 'upload/638e3b233f82c.png', 50, 'lancamento'),
(93, 'Blue Lock Vol. 2', 'Yusuke Nomura', 'Criem o maior ego??sta do mundo!! O futebol estilo Blue Lock vai come??ar!Sob intensa cr??tica da popula????o e da m??dia e do olhar frio do genial e orgulhoso meio-campista do Jap??o, Itoshi Sae, o treinamento na Blue Lock finalmente come??a. Na partida em sistema de liga, onde duas a cada cinco equipes sobrevivem, o Time Z de Isagi tem dificuldades no primeiro jogo disputado s?? com atacantes! ;N??o querem ser o melhor do mundo?! Encontrem a ???arma??? que far?? seu ego florescer e derrubem todos os seus rivais!\r\n', '26.69', '2022-12-05 15:43:17', 'upload/638e3bc51d415.png', 50, 'lancamento'),
(94, 'Blue Lock Vol. 3', 'Yusuke Nomura', 'Com o fim de 2 dos 4 jogos da 1?? Seletiva da Blue Lock, Isagi e o Time Z descobrem o prazer da vit??ria depois de terem derrotado o time advers??rio arriscando as suas carreiras como jogadores de futebol. A vit??ria deixa o time de moral alta para encararem o terceiro jogo contra o Time Y, mas uma inesperada divis??o dentro do Time Z amea??a o seu futuro!  Al??m disso, com um dos jogadores ??? Chigiri Hyoma ??? sem vontade de continuar a lutar, ser?? que nossos her??is poder??o sobreviver aos ataques ferozes dos Irm??os Wanima, os craques do Time W?', '28.80', '2022-12-05 15:43:46', 'upload/638e3be2ebd09.png', 30, 'lancamento'),
(95, 'Record of Ragnarok: Volume 05', 'Azychika', 'O grande confronto entre o perdedor supremo, Kojirou Sasaki e o tirano dos mares, Poseidon finalmente chega ao fim!! E as cartas para a quarta batalha s??o: o assassino mais famoso em toda hist??ria da humanidade, Jack, o Estripador versus o indom??vel deus guerreiro, H??rcules!! Um confronto direto entre o bem e o mal!!! Quem ser?? o vencedor?! O mais terr??vel assassino versus o her??i lend??rio!!!', '26.30', '2022-12-05 15:45:45', 'upload/638e3c59cd728.png', 19, 'lancamento'),
(96, 'Solo Leveling ??? Volume 02 (Full Color)', 'Chugong', 'Um grande fen??meno um dia aconteceu, portais desconhecidos surgiram ligando o mundo que conhecemos a uma realidade totalmente extraordin??ria de monstros e seres fantasiosos, cujo ??nico objetivo era matar humanos. Em resposta a esse novo perigo, surgiram os ???ca??adores???, humanos que foram ???despertados??? e ganharam poderes capazes de bater de frente com essas criaturas. Dentre eles, h?? um conhecido por ser ???a pior arma da humanidade???, sung jin-woo. Mas sua sorte ir?? mudar quando uma incurs??o que deveria ser f??cil se torna um verdadeiro pesadelo. A vers??o imprensa do famoso webtoon.', '49.90', '2022-12-05 16:16:19', 'upload/638e43830be08.png', 50, 'destaque'),
(97, 'Fire Force Vol. 27', 'Atsushi ??kubo', 'A verdade sobre o nascimento dos irm??os ?? revelada!! Enquanto investigava junto de Arrow os mist??rios que cercam a Fam??lia Kusakabe, Shou acaba realizando um Adolla Link e se encontrando com sua m??e, que se tornou um Flamejante. Que decis??o Shou tomar?? ap??s saber a verdade sobre seu nascimento?! Enquanto isso, o oitavo pilar finalmente emerge na Ba??a de Tama e um Raffles I colossal aparece para mergulhar de vez o Imp??rio no desespero! ?? nesse momento que, diante dos gritos do povo assustado e da Tropa do Desastre, que Shinra mostrar?? seu verdadeiro valor como her??i!', '33.90', '2022-12-05 16:19:15', 'upload/638e44561a387.png', 30, 'destaque'),
(98, 'Fire Force - 28', 'Atsushi Ohkubo', 'Com os pilares sendo levados para Adolla, o Grande Desastre se aproxima! Come??a a batalha para proteger a Amaterasu e salvar o planeta da destrui????o!! Shinra e os outros pilares desapareceram rumo a Adolla. Os companheiros que permaneceram correm rumo a Amaterasu, a chave para a conclus??o do Grande Desastre, para impedir a destrui????o do mundo e travar a batalha final contra os Trajes Brancos! Diante de Charon, Dragon e os Colossos Flamejantes de Ritsu, a Oitava Unidade e Ogun fazem de tudo para manter o per??metro defensivo e mant??-los longe da Amaterasu! Mas ?? dentro da usina que Vulcan, Lisa e Yuu topam com algo sinistro...!', '28.80', '2022-12-05 16:50:19', 'upload/638e4b7ba6ac0.png', 27, 'destaque'),
(99, 'Naruto Gold Vol. 42', 'Masashi Kishimoto', 'Pain, aquele que ?? chamado de Deus, ?? na verdade um sexteto de guerreiros detentores do Rinnegan. Jiraiya nota a presen??a de um antigo disc??pulo, Yahiko, entre os seis shinobis, mas j?? ?? tarde demais??? Enquanto isso, um grande confronto de irm??os se inicia entre Sasuke e Itachi!', '22.90', '2022-12-05 16:58:25', 'upload/638e4d61f2e95.png', 21, 'destaque'),
(100, 'Fairy Tail - Vol. 6', 'Hiro Mashima', 'Gray e Natsu est??o lutando contra Lyon e Zalty para impedir que o dem??nio da calamidade volte ?? vida. Mas, enquanto eles tentam derrotar os vil??es, a cerim??nia continua e o gelo em torno de Deliora come??a a derreter.E o que os integrantes da Fairy Tail poder??o fazer para libertar os habitantes da maldi????o da ilha Galuna?', '33.90', '2022-12-05 17:36:43', 'upload/638e565b2fb23.png', 2, 'pre-venda'),
(101, 'Kaiju N.?? 8 Vol. 4', 'Naoya Matsumoto', 'A base das For??as de Defesa localizada em Tachikawa ?? atacada pelos c??us por um bando de kaijus, por??m, os soldados come??am a fazer com que as criaturas-menores recuem atrav??s de seu enorme esfor??o. Hoshina libera todo o seu poder ofensivo e contra-ataca o grande kaiju. Enquanto o vice-comandante acreditava que a luta havia chegado ao fim, a criatura come??a a se transformar e Kafka ?? capaz de perceber isso. Quem ser?? que vai aparecer justamente nesse momento????!Este ?? o quarto volume em que a amea??a continua!!!', '29.70', '2022-12-05 17:44:33', 'upload/638e58313b2d2.png', 60, 'lancamento'),
(102, 'Demon Slayer - Kimetsu No Yaiba Vol. 23', 'Koyoharu Gotouge', 'A batalha entre Muzan Kibutsuji, o progenitor dos Onis e Tanjirou e o Kisatsutai ruma para a sua conclus??o!! Os quatro tipos de rem??dios que Tamayo conseguiu inocular no corpo de Muzan fizeram com que ele enfraquecesse e finalmente fosse encurralado! Qual ser?? o destino de Tanjirou, Nezuko e do Kisatsutai?! O longo confronto contra os Onis finalmente est?? chegando ao seu fim!!', '26.90', '2022-12-05 17:46:29', 'upload/638e58a59fa23.png', 26, 'lancamento');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(256) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `endereco1` varchar(100) DEFAULT NULL,
  `endereco2` varchar(100) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `bairro` varchar(100) DEFAULT NULL,
  `estado` varchar(100) DEFAULT NULL,
  `cep` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`, `data_cadastro`, `admin`, `endereco1`, `endereco2`, `cidade`, `bairro`, `estado`, `cep`) VALUES
(4, 'Administrador', 'admin@admin.com', '$2y$10$phnDfZaOtr06Mn7rIH3zT.mF1S72zzMD5Yv9K75nmiFunzaZPL1Xm', '2022-11-16 11:15:36', 1, 'Rua Di??genes Chianca, 100', 'Casa', 'Jo??o Pessoa', '??gua Fria', 'PB', '58053000'),
(5, 'Usu??rio', 'user@user.com', '$2y$10$jQXWFiSfF3x9.TNWxiQCveQWnMuXZNpfXVDs.q50h8SXQJUXVHt3y', '2022-11-16 11:19:16', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'Deku', 'deku@email.com', '$2y$10$p.rO3J4EHF9sDCP9KweeBeaCcjBAZ0oBQeFfHXxmDqJWr.r2o0JnC', '2022-11-16 14:11:14', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 'Jo??o Victor Nunes de Moura', 'jotaven.moura@gmail.com', '$2y$10$120XN7P1s5qPfWqENXrVCuCCvqbnox/CllSUhIFLRTXi1YCrRSPtG', '2022-12-05 16:04:09', 0, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `compras_produtos`
--
ALTER TABLE `compras_produtos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lista_favoritos`
--
ALTER TABLE `lista_favoritos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `compras`
--
ALTER TABLE `compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `compras_produtos`
--
ALTER TABLE `compras_produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `lista_favoritos`
--
ALTER TABLE `lista_favoritos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
