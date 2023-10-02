programa {
	inclua biblioteca Util --> u
	inclua biblioteca Texto --> t
	logico finalizarPrograma = verdadeiro
	cadeia ListaCachorros[7][8] = { 
								{"Bob", "Macho", "Marrom", "M�dio", "Curto", "Soci�vel", "Michael", "(11) 99999-9999"},
								{"Bella", "F�mea", "Branco", "M�dio", "Curto", "Soci�vel", "Bruno", "email@email.com"}, 
								{"Max", "Macho", "Preto", "Grande", "M�dio", "Independente", "Lizandra Silva", "email@teste.com.br"},
								{"Max", "Macho", "Preto", "Grande", "Curto", "Soci�vel", "Ana", "(11) 11111-1111"},
								{"Luna", "F�mea", "Marrom", "M�dio", "M�dio", "Passivo-agressivo", "Carlos", "carlos@email.com"},
								{"Charlie", "Macho", "Caramelo", "Pequeno", "Longo", "Independente", "Isabela", "(22) 22222-2222"},
								{"Lola", "F�mea", "Marrom", "M�dio", "Curto", "Timido", "Sophia", "sophia@email.com"}
	}
		  
	cadeia ListaGatos[3][7] = { 
			  				{"Simba", "Macho", "Dourado", "Curto", "Soci�vel", "Carla", "carla@email.com"},
								{"Nala", "F�mea", "Marrom", "Curto", "Soci�vel", "Ricardo", "(77) 77777-7777"},
								{"Whiskers", "Macho", "Cinza", "M�dio", "Timido", "Amanda", "amanda@email.com"}
	}
	
	funcao OpcaoErrada() {
		escreva("Ops... Digite apenas as op��es que est�o no menu.\n\n")
		}


	funcao SairDoPrograma() {
		escreva("PetMatch agradece pelo seu tempo.\nAt� logo!! Volte sempre!")
		finalizarPrograma = falso
	}
	
	funcao inicio() {
		enquanto (finalizarPrograma) {
			inteiro opcaoInicial
			escreva("P E T  M A T C H\nEncontre Seu Companheiro Peludo\n\nNo que podemos te ajudar?\n[1] <--> Adotar um companheiro\n[2] <--> Sair\n--> ")
			leia(opcaoInicial)
			limpa()
			escolha (opcaoInicial) {
				caso 1:
					AdotarPet()
				pare
				caso 2:
					SairDoPrograma()
				pare
				caso contrario:
					OpcaoErrada()
			}
		}
	}

	funcao AdotarPet() {
		logico finalizarAdocao = verdadeiro
		enquanto (finalizarAdocao) {
			inteiro opcaoEscolherAnimal
			escreva("ADOTE UM AMIGO\n\n[1] <--> Adotar Cachorro(a)\n[2] <--> Adotar Gato(a)\n[3] <--> Voltar\n--> ")
			leia(opcaoEscolherAnimal)
			limpa()
			escolha (opcaoEscolherAnimal) {
				caso 1:
					AdotarAnimal("Cachorro")
					SairDoPrograma()
					finalizarAdocao = falso
				pare
				caso 2:
					AdotarAnimal("Gato")
					SairDoPrograma()
					finalizarAdocao = falso
				pare
				caso 3:
					finalizarAdocao = falso
				pare
				caso contrario:
					OpcaoErrada()
			}
		}
	}

  funcao AdotarAnimal(cadeia animal) {
		inteiro opcaoPesquisa
		escreva("Procurar ", animal, ":\n[1] <--> Adicionar Filtro\n[2] <--> Ver Todos\n[3] <--> Voltar\n--> ")
		leia(opcaoPesquisa)
		limpa()
		escolha (opcaoPesquisa) {
			caso 1:
        se (animal == "Cachorro")
				  FiltrarPets(ListaCachorros, animal)
        senao
          FiltrarPets(ListaGatos, animal)
			pare
			caso 2:
        se (animal == "Cachorro")
				  FichaAnimal(ListaCachorros, animal, 0, "")
        senao
          FichaAnimal(ListaGatos, animal, 0, "")
			pare
			caso 3:
				finalizarPrograma = verdadeiro
			pare
		}
	}

	funcao FiltrarPets(cadeia pets[][], cadeia animal) {
		inteiro numeroColuna, tipoDeFiltro
		escreva("Procure o seu ", animal, " ideal: \n[1] <--> Sexagem\n[2] <--> Cor\n[3] <--> Pelagem\n[4] <--> Temperamento\n")
		se (animal == "Cachorro") { escreva("[5] <--> Porte\n") } 
		escreva("--> ")
		leia(tipoDeFiltro)
		escolha (tipoDeFiltro) {
			caso 1:
				cadeia opcaoSexagem
				numeroColuna = 1
				escreva("\nFiltrar pelo sexo:\n[F] <--> F�mea\n[M] <--> Macho\n--> ")
				leia(opcaoSexagem)
				limpa()
				se (t.caixa_alta(opcaoSexagem) == "F") {
					opcaoSexagem = "F�mea"
				} senao se (t.caixa_alta(opcaoSexagem) == "M") {
					opcaoSexagem = "Macho"
				}
				FichaAnimal(pets, animal, numeroColuna, opcaoSexagem)
			pare
			
			caso 2:
				inteiro opcaoCor
				cadeia corSelecionada =  ""
				numeroColuna = 2
				escreva("\nFiltrar pela cor dominante:\n[1] <--> Preto\n[2] <--> Marrom\n[3] <--> Caramelo\n[4] <--> Dourado\n[5] <--> Branco\n[6] <--> Tigrado\n[7] <--> Cinza\n[8] <--> Ruivo\n--> ")
				leia(opcaoCor)
				limpa()
				escolha (opcaoCor) {
					caso 1:
						corSelecionada = "Preto"
					pare
					caso 2:
						corSelecionada = "Marrom"
					pare
					caso 3:
						corSelecionada = "Caramelo"
					pare
					caso 4:
						corSelecionada = "Dourado"
					pare
					caso 5:
						corSelecionada = "Branco"
					pare
					caso 6:
						corSelecionada = "Tigrado"
					pare
					caso 7:
						corSelecionada = "Cinza"
					pare
					caso 8:
						corSelecionada = "Ruivo"
					pare
					caso contrario:
						escreva("\nN�o existe nenhum animal cadastrado que tenha essa caracteristica.\n\n")
				}
				FichaAnimal(pets, animal, numeroColuna, corSelecionada)
			pare
	
			caso 3:
				inteiro opcaoPelagem
				cadeia pelagemSelecionada = ""
				se (animal == "Gato") {
					numeroColuna = 3
				} senao {
					numeroColuna = 4
				}
				escreva("\nFiltrar pelo tamanho da pelagem:\n[1] <--> Curto\n[2] <--> M�dio\n[3] <--> Longo\n--> ")
				leia(opcaoPelagem)
				limpa()
				escolha (opcaoPelagem) {
					caso 1:
						pelagemSelecionada = "Curto"
					pare
					caso 2:
						pelagemSelecionada = "M�dio"
					pare
					caso 3:
						pelagemSelecionada = "Longo"
					pare
					caso contrario:
						escreva("\nN�o existe nenhum animal cadastrado que tenha essa caracteristica.\n\n")
				}
				FichaAnimal(pets, animal, numeroColuna, pelagemSelecionada)
			pare
			
			caso 4:
				inteiro opcaoTemperamento
				cadeia temperamentoSelecionado =""
				se (animal == "Gato") {
					numeroColuna = 4
				} senao {
					numeroColuna = 5
				}
				escreva("\nFiltrar pelo temperamento:\n[1] <--> Agressivo\n[2] <--> Timido\n[3] <--> Passivo-agressivo\n[4] <--> Soci�vel\n[5] <--> Independente\n--> ")
				leia(opcaoTemperamento)
				limpa()
				escolha (opcaoTemperamento) {
					caso 1:
						temperamentoSelecionado = "Agressivo"
					pare
					caso 2:
						temperamentoSelecionado = "Timido"
					pare
					caso 3:
						temperamentoSelecionado = "Passivo-agressivo"
					pare
					caso 4:
						temperamentoSelecionado = "Soci�vel"
					pare
					caso 5:
						temperamentoSelecionado = "Independente"
					pare
					caso contrario:
						escreva("\nN�o existe nenhum animal cadastrado que tenha essa caracteristica.\n\n")
				}
				FichaAnimal(pets, animal, numeroColuna, temperamentoSelecionado)
			pare

			caso 5:
				se (animal ==  "Gato") {
					escreva("Apenas a ado��o de cachorros tem acesso a este tipo de filtro.")
					pare
				}
				inteiro opcaoPorte
				cadeia porteSelecionado = ""
				numeroColuna = 3
				escreva("\nFiltrar pelo porte:\n[1] <--> Pequeno\n[2] <--> M�dio\n[3] <--> Grande\n--> ")
				leia(opcaoPorte)
				limpa()
				escolha (opcaoPorte) {
					caso 1:
						porteSelecionado = "Pequeno"
					pare
					caso 2:
						porteSelecionado = "M�dio"
					pare
					caso 3:
						porteSelecionado = "Grande"
					pare
					caso contrario:
						escreva("\nN�o existe nenhum animal cadastrado que tenha essa caracteristica.\n\n")
				}
				FichaAnimal(pets, animal, numeroColuna, porteSelecionado)
			pare
			
			caso contrario:
				escreva("\nOp��o solicitada � inv�lida. Insira uma nova op��o:\n")
		}
	}

	funcao FichaAnimal(cadeia pet[][], cadeia animal, inteiro colunaAlvo, cadeia comparador) {
    inteiro indices[7], contIndices=0
		para (inteiro linha = 0; linha < u.numero_linhas(pet); linha++) {
			se (animal == "Cachorro") {
				se ((pet[linha][colunaAlvo] == comparador) ou (comparador == "")) {
          indices[contIndices] = linha
          contIndices++
					escreva("Op��o: ",linha + 1,"\nNome: ", pet[linha][0], "\nSexo: ", pet[linha][1], "\nCor: ", pet[linha][2], "\nTamanho: ", pet[linha][3], "\nPelagem: ", pet[linha][4], "\nTemperamento: ", pet[linha][5], "\nDoador: ", pet[linha][6], "\nContato: ", pet[linha][7], "\n---------------------------------------------------\n\n")
				}
			} senao se (animal == "Gato") {
				se ((pet[linha][colunaAlvo] == comparador) ou (comparador == "")) {
          indices[contIndices] = linha
          contIndices++
					escreva("Op��o: ",linha + 1,"\nNome: ", pet[linha][0], "\nSexo: ", pet[linha][1], "\nCor: ", pet[linha][2], "\nPelagem: ", pet[linha][3], "\nTemperamento: ", pet[linha][4], "\nDoador: ", pet[linha][5], "\nContato: ", pet[linha][6], "\n---------------------------------------------------\n\n")
				}
			}
		}
		inteiro selecionarPet
		caracter adotar
		logico achou = falso
    se(contIndices>0){
			escreva("Digite o n�mero da op��o que indica o pet\n--> ")
    	leia(selecionarPet)
    		para(inteiro i=0; i<7; i++){
				se ((selecionarPet-1) == indices[i]) {
					achou = verdadeiro
					pare
				}
    	}
		}

    se(achou == verdadeiro){
      escreva("\nDeseja adotar (s/n)?: ")
      leia(adotar)
      limpa()
      se (adotar == 's'){
        escreva("\nVoc� confirmou a ado��o!\n\n")
      }
      finalizarPrograma = falso
    }

    senao {
      escreva("\nAnimal n�o encontrado!\n\n")
      finalizarPrograma = falso
    }
	}
}
