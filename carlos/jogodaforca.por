programa
{

	// Inclusao das blibiotecas usada
	
	inclua biblioteca Arquivos --> a
	inclua biblioteca Util --> u
	inclua biblioteca Texto --> t

	// Definição de variaveis globais

	cadeia palavraSecreta, listaPalavras[245367]
	inteiro i
	cadeia nome, tema = ""

	// Serve de botão para pausa em algumas partes do código
	cadeia continuar = ""

	// Menu principal do jogo
	funcao menu1()
	{

		// Arte principal do jogo feita no gerador ASCII online
		escreva(
					"\n",
					"\n       ▄█  ▄▀▀▀▀▄   ▄▀▀▀▀▄    ▄▀▀▀▀▄       ▄▀▀█▄▄   ▄▀▀█▄       ▄▀▀▀█▄    ▄▀▀▀▀▄   ▄▀▀▄▀▀▀▄  ▄▀▄▄▄▄   ▄▀▀█▄  ",
					"\n ▄▀▀▀█▀ ▐ █      █ █         █      █     █ ▄▀   █ ▐ ▄▀ ▀▄     █  ▄▀  ▀▄ █      █ █   █   █ █ █    ▌ ▐ ▄▀ ▀▄ ",
					"\n█    █    █      █ █    ▀▄▄  █      █     ▐ █    █   █▄▄▄█     ▐ █▄▄▄▄   █      █ ▐  █▀▀█▀  ▐ █        █▄▄▄█ ",
					"\n▐    █    ▀▄    ▄▀ █     █ █ ▀▄    ▄▀       █    █  ▄▀   █      █    ▐   ▀▄    ▄▀  ▄▀    █    █       ▄▀   █ ",
					"\n  ▄   ▀▄    ▀▀▀▀   ▐▀▄▄▄▄▀ ▐   ▀▀▀▀        ▄▀▄▄▄▄▀ █   ▄▀       █          ▀▀▀▀   █     █    ▄▀▄▄▄▄▀ █   ▄▀  ",
					"\n   ▀▀▀▀            ▐                      █     ▐  ▐   ▐       █                  ▐     ▐   █     ▐  ▐   ▐   ",
					"\n                                          ▐                    ▐                            ▐                ",
					"\n"
				)

		// Botões de opções que será chamado na funcão inicio do código
		escreva(
					"\n",
					"\n[1] Jogar",
					"\n[2] Sair",
					"\n[3] Integrantes",
					"\n"
				)
	}

	// Menu secundario
	funcao menu2()
	{

		// Escolha de temas para começar o jogo
		inteiro opcao
		cadeia categoria = ""

		escreva("\nEscolha o tema na qual queira jogar:")
		escreva("\n\n[1] Palavras gerais")
		escreva("\n[2] Animais")
		escreva("\n[3] Nomes")
		escreva("\n[4] Frutas")
		escreva("\n[5] Paises")
		escreva("\n\n[6] Voltar menu principal")

		escreva("\n\nDigite seu nome: ")
		leia(nome)

		se(nome == "")
		{
			escreva("\nVocê ainda não digitou seu nome, tente novamente...")
			escreva("\n\nAperte 'Enter' para continuar...")
			leia(continuar)
			limpa()
			menu2()
		}

		
		escreva("\n\nEscolha uma opção: ")
		leia(opcao)

		se(opcao == 1)
		{
			tema = "Palavras Gerais"
		}

		senao se(opcao == 2)
		{
			tema = "Animais"
		}

		senao se(opcao == 3)
		{
			tema = "Nomes"
		}

		senao se(opcao == 4)
		{
			tema = "Frutas"
		}

		senao se (opcao == 5)
		{
			tema = "Paises"
		}

		escolha(opcao)
		{
			caso 1:
			categoria = "palavras.txt"
			pare

			caso 2:
			categoria = "animais.txt"
			pare

			caso 3:
			categoria = "nomes.txt"
			pare

			caso 4:
			categoria = "frutas.txt"
			pare

			caso 5:
			categoria = "paises.txt"
			pare

			caso 6:
			limpa()
			inicio()
			pare

			caso contrario:
			escreva("\nOpção inválida! Tente novamente...")
			escreva("\n\nAperte 'Enter' para continuar!")
			leia(continuar)
			limpa()
			menu2()
		}

		// Aleatorização das palavras de acorodo com o tema escolhido
		cadeia caminho = "C:\\Users\\José\\Documents\\jogodaforca\\" + categoria

		inteiro arquivo = a.abrir_arquivo(caminho, a.MODO_LEITURA)

		i = 0

		enquanto (nao a.fim_arquivo(arquivo) e i < 245367)
			{
				listaPalavras[i] = a.ler_linha(arquivo)
				i++
			}

		a.fechar_arquivo(arquivo)

		inteiro sorteio = u.sorteia(0, i - 1)
		palavraSecreta = listaPalavras[sorteio]
		limpa()
		jogo()

	}

	// Lógica do jogo
	funcao jogo()
	{

		// Arte inicial
		escreva("\n\nTema da vez: ", tema)

		escreva("\n_________________________________________")
		escreva("\n| Palavra Sorteada! Tente ficar vivo... |")
		escreva("\n=========================================")

		escreva("\n\nVitima da vez: ", nome)
		escreva("\n_______________")
		escreva("\n|/      |      ")
		escreva("\n|              ")
		escreva("\n|              ")
		escreva("\n|              ")
		escreva("\n|              ")
		escreva("\n|              ")
		escreva("\n|              ")
		escreva("\n|\\            ")
		escreva("\n===============")
		escreva("\n|             |")

		// Declaração de variaveis para funcionar o jogo
		inteiro tamanhoPalavra, acertos = 0, erros = 0, tentativas = 6
		tamanhoPalavra = t.numero_caracteres(palavraSecreta)

		logico venceu = falso
		cadeia progresso = ""
		
		caracter letraCerta
		
		caracter letraEscolhida[26]
		inteiro letrasT = 0

		// Laço para fazer o pontilhado da palavra oculta
		para (i = 0; i < tamanhoPalavra; i++)
		{
			progresso += "_ "
		}

		// Aqui o jogo se repete até as condições sejam cumpridas
		enquanto(acertos < tamanhoPalavra e erros < tentativas)
		{

			// Mostra o numero de tentativas restantes e o pontilhado
			escreva("\n\nTentativas: ", tentativas - erros)
			escreva("\n\nPalavra Oculta: ", progresso)

			// Onde será digitado a letra que a pessoa escolher
			caracter letraDigitada
			escreva("\n\nDigite uma letra: ")
			leia(letraDigitada)
			limpa()
			logico repetiu = falso

			// Mostra letras já digitada
			escreva("\n\nLetras escolhidas: ")

			// Verificação da letra repetida
			para (i = 0; i < letrasT; i++)
			{
				escreva(letraEscolhida[i], " ")
				se (letraEscolhida[i] == letraDigitada)
				{
					repetiu = verdadeiro
				}
			}

			// Mostra caso a letra for repetida e não conta como tentativa
			se (repetiu)
			{
				escreva("\n\nVocê já usou essa letra!! Tente outra...")
			}

			// Começo da lógica para verificação da letra na palavra
			senao
			{

				// Se não houver letras repetidas será adiconado numa lista de letras escolhidas
				letraEscolhida[letrasT] = letraDigitada
				letrasT++

				cadeia novoProgresso = ""
				logico acertou = falso

				// Verifica se a letra contem na palavra e substitui o pontilhado pela a letra caso esteja certo
				para (i = 0; i < tamanhoPalavra; i++)
				{
					letraCerta = t.obter_caracter(palavraSecreta, i)
				
					se (letraDigitada == letraCerta)
					{
						novoProgresso += letraCerta + " "
						acertos++
						acertou = verdadeiro
					}
					senao
					{
						novoProgresso += t.obter_caracter(progresso, i * 2) + " "
					}
				}

				progresso = novoProgresso

				// Se errar a letra soma um erro, dita uma mesnagem de letra incorreta e desenha a forca com forme for acrescetando os erros
				se (acertou == falso)
				{
					erros++
					escreva("\n\nTema da vez: ", tema)
					escreva("\n___________________________")
					escreva("\n| Aviso: letra incorreta! |")
					escreva("\n===========================")

					escolha(erros)
					{

						caso 1:
						escreva("\n\nTema da vez: ", tema)
						escreva("\n\nVitima da vez: ", nome)
						escreva("\n_______________")
						escreva("\n|/      |      ")
						escreva("\n|       ,,     ")
						escreva("\n|      ( )     ")
						escreva("\n|              ")
						escreva("\n|              ")
						escreva("\n|              ")
						escreva("\n|              ")
						escreva("\n|\\            ")
						escreva("\n===============")
						escreva("\n|             |")
						pare

						caso 2:
						escreva("\n\nTema da vez: ", tema)
						escreva("\n\nVitima da vez: ", nome)
						escreva("\n_______________")
						escreva("\n|/      |      ")
						escreva("\n|       ,,     ")
						escreva("\n|      ( )     ")
						escreva("\n|       |      ")
						escreva("\n|              ")
						escreva("\n|              ")
						escreva("\n|              ")
						escreva("\n|\\            ")
						escreva("\n===============")
						escreva("\n|             |")

						pare

						caso 3:
						escreva("\n\nTema da vez: ", tema)
						escreva("\n\nVitima da vez: ", nome)
						escreva("\n_______________")
						escreva("\n|/      |      ")
						escreva("\n|       ,,     ")
						escreva("\n|      ( )     ")
						escreva("\n|       |?     ")
						escreva("\n|              ")
						escreva("\n|              ")
						escreva("\n|              ")
						escreva("\n|\\            ")
						escreva("\n===============")
						escreva("\n|             |")

						pare

						caso 4:
						escreva("\n\nTema da vez: ", tema)
						escreva("\n\nVitima da vez: ", nome)
						escreva("\n_______________")
						escreva("\n|/      |      ")
						escreva("\n|       ,,     ")
						escreva("\n|      ( )     ")
						escreva("\n|      !|?     ")
						escreva("\n|              ")
						escreva("\n|              ")
						escreva("\n|              ")
						escreva("\n|\\            ")
						escreva("\n===============")
						escreva("\n|             |")

						pare

						caso 5:
						escreva("\n\nTema da vez: ", tema)
						escreva("\n\nVitima da vez: ", nome)
						escreva("\n_______________")
						escreva("\n|/      |      ")
						escreva("\n|       ,,     ")
						escreva("\n|      ( )     ")
						escreva("\n|      !|?     ")
						escreva("\n|       |      ")
						escreva("\n|              ")
						escreva("\n|              ")
						escreva("\n|\\            ")
						escreva("\n===============")
						escreva("\n|             |")

						pare

					}
				}

				// Se a letra estiver correta, dita a mensagem de letra certa
				senao
				{

					escreva("\n\nTema da vez: ", tema)
					escreva("\n__________________")
					escreva("\n| Letra Correta! |")
					escreva("\n==================")

				}

				// Se a quantidade de acrtos atingir o tamanho da palavra conta como vitória, será exibido que a pessoa ficou vivo e perguntará se ela quer jogar novamente ou sair do jogo
				se (acertos == tamanhoPalavra)
				{
					venceu = verdadeiro
					inteiro opcao

					escreva("\n\nTema da vez: ", tema)
					escreva("\n\nVitima da vez: ", nome)
					escreva("\n_______________")
					escreva("\n|/      |      ")
					escreva("\n|              ")
					escreva("\n|              ")
					escreva("\n|      ,,,,    ")
					escreva("\n|     (o_o)    ")
					escreva("\n|      (|)     ")
					escreva("\n|       |      ")
					escreva("\n|\\      77    ")
					escreva("\n===============")
					escreva("\n|             |")

					escreva("\n\nParabéns ",nome,", você ficou vivo(a)! A palavra é: ", palavraSecreta + ".")
					escreva("\n_________________________________")
					escreva("\n| [1] Voltar ao menu principal  |")
					escreva("\n| [2] Sair do jogo              |")
					escreva("\n=================================")
					escreva("\n\n[ ] Escolha uma opção: ")
					leia(opcao)
					limpa()

					escolha(opcao)
					{
						caso 1:
						inicio()
						pare

						caso 2:
						limpa()
						escreva("Saindo do jogo...")
						pare
					}
				}

				// Se a quantidade de error atingir a quantidade de tentativas será uma derrota, exibe que a pessoa foi enforcada e pergunta se quer jogar novamente ou sair do jogo
				se (erros == tentativas)
				{
					inteiro opcao
					limpa()

					escreva("\n\nTema da vez: ", tema)
					escreva("\n_______________")
					escreva("\n|/      |      ")
					escreva("\n|      ,,,,    ")
					escreva("\n|     (x_x)    ")
					escreva("\n|      (|)     ")
					escreva("\n|       |      ")
					escreva("\n|       77     ")
					escreva("\n|              ")
					escreva("\n|\\            ")
					escreva("\n===============")
					escreva("\n|             |")
					escreva("\n|             |")
					escreva("\n===============")

					escreva("\n\nVOCÊ MORREU KKKKK, a palavra era: ", palavraSecreta + ".")
					escreva("\n_________________________________")
					escreva("\n| [1] Voltar ao menu principal  |")
					escreva("\n| [2] Sair do jogo              |")
					escreva("\n=================================")
					escreva("\n\n[] Escolha uma opção: ")
					leia(opcao)
					limpa()

					escolha(opcao)
					{
						caso 1:
						inicio()
						pare

						caso 2:
						limpa()
						escreva("Saindo do jogo...")
						pare
					}
				}
			}
		}
	}

	// Função que dará inicio ao nosso código
	funcao inicio()
	{
		// Chama a função do menu principal do jogo
		menu1()

		// Pede para escolher uma das opçoes no menu principal
		inteiro opcao
		escreva("\n[ ] Escolha uma opção: ")
		leia(opcao)
		limpa()

		// Direciona o jogador na opção que ele escolher
		escolha(opcao)
		{
			caso 1:
			menu2()
			pare

			caso 2:
			limpa()
			escreva("Saindo do jogo...")
			pare

			caso 3:
			escreva
			(
			"\n   ---------------------",
			"\n   |   Integrantes:    |",
			"\n   ---------------------", 
			"\n   | Arthur Santos     |",
			"\n   | Bruno Raolino     |",
			"\n   | Gabriel Cirqueira |",
			"\n   | Isaac Wandermuren |",
			"\n   | José F. Lucas     |",
			"\n   | Willyan Queiroz   |",
			"\n   ---------------------"
			)

			escreva("\n\nAperte 'Enter' para retornar...")
			leia(continuar)
			limpa()
			inicio()
			pare

			caso contrario:
			escreva("\nOpção inválida!")
			escreva("\n\nAperte 'Enter' para continuar...")
			leia(continuar)
			limpa()
			inicio()
		}
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1676; 
 * @DOBRAMENTO-CODIGO = [77, 82, 87, 92, 97, 102];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */