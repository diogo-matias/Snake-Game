programa {
    inclua biblioteca Util --> u
    inclua biblioteca Graficos --> g  
    inclua biblioteca Teclado --> t

    const inteiro ALTURA_JANELA = 600
    const inteiro LARGURA_JANELA = 600

	inteiro pontuacao = 0 

	logico direita = falso, esquerda = falso, para_cima = falso, para_baixo = falso

	inteiro xposicoes_comida [24] = {
		0,25,50,75,100,125,150,175,200,225,250,275,300,325,350,375,400,425,450,475,500,525,550,575 
	}
	inteiro yposicoes_comida [21] = {
		75,100,125,150,175,200,225,250,275,300,325,350,375,400,425,450,475,500,525,550,575
	}

	inteiro xcomida = 300
	inteiro ycomida = 300

	inteiro xcauda_cobra[600]
	inteiro ycauda_cobra[600]
	
	inteiro tamanho_cobra=2
	
	inteiro xcabeca_cobra = 350
	inteiro ycabeca_cobra = 350
	inteiro ALTURA_PAINEL = 75


	inteiro delay = 100
	
	
    funcao inicio() {
        montar_janela ()
       
    		enquanto (verdadeiro) {
    			 pintar_janela ()
    			 desenhar_painel ()
    			 direcionar_cobra ()
    			 atualizar_posicao_cobra ()
    	
    			 mecher_cobra ()
    			 atualizar_pontuacao ()
    			 reiniciar ()
    			 desenhar_comida ()
    			 desenhar_cabeca_cobra ()
    			 desenhar_cauda_cobra ()
    			 sortear_comida ()
    			 cobra_bateu_parede ()
    			 
    			
    			 
    			g.renderizar ()
    			 u.aguarde(delay)
    			 
    		}
    }

    funcao montar_janela(){
    g.iniciar_modo_grafico(verdadeiro)
    g.definir_dimensoes_janela(LARGURA_JANELA, ALTURA_JANELA)
    g.definir_titulo_janela("Jogo da cobrinha")
    }

	funcao pintar_janela () {
	g.definir_cor(g.COR_BRANCO)
	g.limpar()
		
	}

	funcao desenhar_painel (){
	g.definir_cor(g.COR_AMARELO)
	g.desenhar_retangulo(0, 0, LARGURA_JANELA, ALTURA_PAINEL, falso, verdadeiro)
	g.definir_cor(g.COR_PRETO)
	g.definir_tamanho_texto(20)
	g.desenhar_texto(20, 20, "Pontuação: " + pontuacao)

}

	funcao desenhar_cabeca_cobra (){
	g.definir_cor(g.COR_PRETO)
	g.desenhar_retangulo(xcabeca_cobra, ycabeca_cobra, 25, 25, falso, verdadeiro)
		
	}

	funcao jorge_cabeca_cobra (){
	g.definir_cor(g.COR_PRETO)
	g.desenhar_retangulo(xcabeca_cobra, ycabeca_cobra, 25, 25, falso, verdadeiro)
		
	}


	funcao direcionar_cobra () {
		se (t.tecla_pressionada(t.TECLA_SETA_DIREITA)){
			direita = verdadeiro
			esquerda = falso
			para_cima = falso
			para_baixo = falso
		}

		senao se (t.tecla_pressionada(t.TECLA_SETA_ESQUERDA)){
			direita = falso
			esquerda = verdadeiro
			para_cima = falso
			para_baixo = falso
		}
		senao se (t.tecla_pressionada(t.TECLA_SETA_ACIMA)){
			direita = falso
			esquerda = falso
			para_cima = verdadeiro
			para_baixo = falso
		}
		senao se (t.tecla_pressionada(t.TECLA_SETA_ABAIXO)){
			direita = falso
			esquerda = falso
			para_cima = falso
			para_baixo = verdadeiro
		}
	}

	funcao mecher_cobra () {
		se (direita) {
			xcabeca_cobra += 25
		}

		se (esquerda) {
			xcabeca_cobra -= 25
		}

		se (para_cima) {
			ycabeca_cobra -= 25
		}

		se (para_baixo) {
			ycabeca_cobra += 25
		}
		
	}

	funcao logico cobra_bateu_parede () {
		se (xcabeca_cobra >= LARGURA_JANELA ou xcabeca_cobra < 0){
			retorne verdadeiro
		}

		senao se (ycabeca_cobra >= (ALTURA_JANELA) ou ycabeca_cobra < ALTURA_PAINEL){
			retorne verdadeiro
		}
		
		senao {
			retorne falso
		}
		
	}

	funcao reiniciar () {
		se (cobra_bateu_parede ()) {
			xcabeca_cobra = 275
			ycabeca_cobra = 275

			tamanho_cobra = 2
			direita = falso
			esquerda = falso
			para_cima = falso
			para_baixo = falso
		}
	}

	funcao logico cobra_comeu_comida (){
		se (xcabeca_cobra == xcomida e ycabeca_cobra == ycomida){
			retorne verdadeiro
		} senao {
			retorne falso
		}
	}

	funcao sortear_comida (){
		inteiro xindice = u.sorteia(0, 23)
		inteiro yindice = u.sorteia(0, 21)

		se (cobra_comeu_comida()) {
			xcomida = xposicoes_comida[xindice]
			ycomida = yposicoes_comida[yindice]
			
		}
	}

	funcao desenhar_comida (){
		g.definir_cor(g.COR_VERMELHO)
		g.desenhar_retangulo(xcomida, ycomida, 25, 25, falso, verdadeiro)
	}

	funcao atualizar_posicao_cobra () {
		xcauda_cobra[0] = xcabeca_cobra
		ycauda_cobra[0] = ycabeca_cobra

		para (inteiro i = 599; i > 0; i--){
			xcauda_cobra[i] = xcauda_cobra[i-1]
			ycauda_cobra[i] = ycauda_cobra[i-1]
		}
	}

	funcao desenhar_cauda_cobra (){
		se (cobra_comeu_comida()){
			tamanho_cobra++
		}
		para (inteiro i = 0; i < tamanho_cobra; i++){
			g.desenhar_retangulo(xcauda_cobra[i], ycauda_cobra[i], 25, 25, falso, verdadeiro)
		}
	}
	
	funcao atualizar_pontuacao (){
		pontuacao = tamanho_cobra - 2 
	}


	
	}


	

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 436; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */