--Definição de funções
--Eu estou colocando aqui antes do while true pra diminuir a necessidade de processamento
--Eu estou colocando todas as funções que talvez eu precise usar aqui para não ter que ir procurar os trem em outros lugares
--Eu acho que mandar o programa abrir outros scripts exige uma capacidade de procesamento muito alta para poder operar no meu notebook
--Funções de matemática
--Ela retorna a soma dos argumentos
function soma(...)
  local arg={...}
  local cmd=0
  for idx=1,#arg do
    cmd=cmd+arg[idx]
  end
  return cmd
end

--Ela retorna a média aritmética dos argumentos
function media(...)
  local arg={...}
  local cmd=soma(...)/#arg
  return cmd
end

--Ela retorna o maior valor dentre os argumentos
function maior(...)
  local arg={...}
  local cmd=arg[1]
  for idx=1,#arg do
    if cmd<arg[idx] then
      cmd=arg[idx]
    end
  end
  return cmd
end

--Ela retorna o índice do maior valor dentre os argumentos
function maior2(...)
local t = {...}
local key, max = 1, t[1]
for k, v in ipairs(t) do
    if t[k] > max then
        key, max = k, v
    end
end
return key
end
--Ela retona o menor valor dentre os argumentos
function menor(...)
  local arg={...}
  local cmd=arg[1]
  for idx=1,#arg do
    if cmd>arg[idx] then
      cmd=arg[idx]
    end
  end
  return cmd
end
--Retorna o valor absoluto do argumento
function abs(num)
  return math.abs(num)
end
--Retorna o desvio médio
function desvio_medio(...)
  local arg={...}
  tb1={}
  local cmd=0
  for idx=1,#arg do
    tb1[idx]=abs(arg[idx]-media(...))
    cmd=cmd+tb1[idx]
  end
  return cmd/#arg
end

--Multiplica os argumentos
function mult(...)
  local arg={...}
  local cmd=1
  for idx=1,#arg do
    cmd=cmd*arg[idx]
  end
  return cmd
end

--Retorna a raiz quadrada
function raiz(num)
  return math.sqrt(num)
end
--Eleva a uma potência
function potencia(base,exp)
  return math.pow(base,exp)
end
--Calcula o fatorial
function fatorial(num)
  local cmd=1
  if num==0 then
    return 1
  else
    for idx=1,num do
      cmd=cmd*idx
    end
  end
  return cmd
end
--Retorna um número aleatório
function aleatorio_entre(min,max)
  return math.random(min,max)
end
--Calcula a combinação
function combin(max,min)
  return fatorial(max)/fatorial(min)/fatorial(max-min)
end
--Conta a quantidade de argumentos
function cont(...)
  local arg={...}
  return #arg
end
--Retorna a diferença entre o maior e o menor valor
function amplitude(...)
  return maior(...)-menor(...)
end
--Retorna a variância populacional
function vap_p(...)
  local arg={...}
  local cmd=0
  for idx=1,#arg do
    cmd=cmd+potencia(arg[idx]-media(...),2)/cont(...)
  end
  return cmd
end
--Retorna a variância amostral
function var_a(...)
  local arg={...}
  local cmd=0
  for idx=1,#arg do
    cmd=cmd+potencia(arg[idx]-media(...),2)/(cont(...)-1)
  end
  return cmd
end
--Retorna o desvio padrão populacional
function desvpad_p(...)
  return raiz(vap_p(...))
end
--Retorna o desvio padrão amostral
function desvpad_a(...)
  return raiz(var_a(...))
end
--Retorna o cf.vr. populacional
function coeficiente_de_variacao_p(...)
  return desvpad_p(...)/media(...)
end
--Retorna o cf.vr. amostral
function coeficiente_de_variacao_a(...)
  return desvpad_a(...)/media(...)
end
--Retorna a média geométrica
function media_geom(...)
  return potencia(mult(...),1/cont(...))
end
function media_harmonica(...)
  local arg={...}
  local tb={}
  for idx=1,#arg do
    tb[idx]=potencia(arg[idx],-1)
  end
  return potencia(soma(table.unpack(tb)),-1)*#arg
end
--Fim das funções matemáticas

-- LISTA DE BOTÕES
  function c()
    return joypad.set({Up=1},1)
  end
  function bx()
    return joypad.set({Down=1},1)
  end
  function e()
    return joypad.set({Left=1},1)
  end
  function d()
    return joypad.set({Right=1},1)
  end
  function a()
    return joypad.set({A=1},1)
  end
  function b()
    return joypad.set({B=1},1)
  end
  function t()
    return joypad.set({Start=1},1)
  end
  function l()
    return joypad.set({Select=1},1)
  end
  -- FIM DE LISTA DE BOTÕES
  
  -- INFORMA UM ERRO
  function err(x)
    while true do
      g(100,200,'Houve um erro em '..x)
      fr(1)
    end
  end
  --FIM
  
  -- FUNÇÃO PARA AVANÇAR O FRAME
  function fr(x)
    for q = 1 , x do
      emu.frameadvance()
    end
  end
  -- FIM DA FUNÇÃO
  
  --FUNÇÃO GUI.TEXT() SIMPLIFICADA
  function g(x,y,z)
    gui.text(x,y,z)
  end
  --FIM DA FUNÇÃO
  
  -- ESTA FUNÇÃO GERA A MÉDIA DE INFINITOS ATAQUES NORMAIS
  function calc_med_nor(atk,def)
    local tb={}
    for idx=0,atk do
      tb[idx]=idx+atk
    end
    for idx=0,atk do
      tb[idx]=tb[idx]-def
    end
    for idx=0,atk do
      if tb[idx]<1 then
        tb[idx]=1
      end
    end
    local cmd=0
    for idx=0,atk do
      cmd=cmd+tb[idx]
    end
    return cmd/(atk+1)
  end
  -- FIM DA FUNÇÃO
  
  -- ESTA FUNÇÃO GERA A MÉDIA DE INFINITOS ATAQUES CRÍTICOS
  function calc_med_crt(atk,def)
    local tb={}
    for idx=0,atk do
      tb[idx]=2*(idx+atk)
    end
    for idx=0,atk do
      tb[idx]=tb[idx]-def
    end
    for idx=0,atk do
      if tb[idx]<1 then
        tb[idx]=1
      end
    end
    local cmd=0
    for idx=0,atk do
      cmd=cmd+tb[idx]
    end
    return cmd/(atk+1)
  end
  -- FIM DA FUNÇÃO
  
  -- ESTA FUNÇÃO GERA A PROBABILIDADE DE O ATACANTE CONSEGUIR TER SUCESSO EM UM FIGHT
  function chc_act(hit,ev)
    local cmd=168+hit
    if cmd>255 then
      cmd=255
    end
    cmd=cmd-ev
    if cmd<0 then
      cmd=0
    end
    if cmd>200 then
      cmd=200
    end
    return (cmd+1)/201
  end
  --FIM DA FUNÇÃO
  
  -- ESTA FUNÇÃO GERA A PROBABILIDADE DE O ATACANTE NÃO CONSEGUIR TER SUCESSO EM UM FIGHT
  function chc_err(hit,ev)
    return 1-chc_act(hit,ev)
  end
  -- FIM DA FUNÇÃO
  
  -- ESTA FUNÇÃO INDICA A PROBABILIDADE DE ACERTAR UM FIGHT CRÍTICO
  function chc_crt(hit,ev,crt)
    return (crt+1)/201*chc_act(hit,ev)
  end
  -- FIM DA FUNÇÃO
  
  -- ESTA FUNÇÃO INDICA A PROBABILIDADE DE ACERTAR UM FIGHT NORMAL
  function chc_nor(hit,ev,crt)
    return chc_act(hit,ev)-chc_crt(hit,ev,crt)
  end
  -- FIM DA FUNÇÃO
  
  -- ESTA FUNÇÃO INDICA O NÚMERO DE HITS QUE O ATACANTE EXECUTARÁ
  -- NÃO NESCESSÁRIAMENTE TODOS OS ATAQUES TERÃO SUCESSO
  -- JOB==2 SIGNIFICA QUE SE TRATA DE UM BLACK BELT
  -- JOB==8 SIGNIFICA QUE SE TRATA DE UM MASTER
  -- WP==0 SIGNIFICA QUE O PC ESTÁ DESARMADO
  function num_hits(hit,multp,job,wp)
    local cmd=math.floor(hit/32)+1
    cmd=cmd*multp
    if (job==2 or job==8) and wp==0 then
      cmd=2*cmd
    end
    if cmd<1 then
      cmd=1
    end
    return cmd
  end
  -- FIM DA FUNÇÃO
  
  -- ESTA FUNÇÃO DÁ A MÉDIA DE INFINITOS FIGHT
  -- ELA LEVA EM CONSIDERAÇÃO QUE O ALVO PODE SE ESQUIVAR
  -- ELA LEVA EM CONSIDERAÇÃO QUE O ATAQUE PODE SER CRÍTICO
  -- ELA LEVA EM CONSIDERAÇÃO A QUANTIDADE DE HITS POR FIGHT
  -- JOB==2 SIGNIFICA QUE SE TRATA DE UM BLACK BELT
  -- JOB==8 SIGNIFICA QUE SE TRATA DE UM MASTER
  -- WP==0 SIGNIFICA QUE O PC ESTÁ DESARMADO
  function media_geral(atk,def,hit,evade,crt,multp,job,wp)
   local cmd1=calc_med_nor(atk,def)
   local cmd2=calc_med_crt(atk,def)
   cmd1=cmd1*chc_nor(hit,evade,crt)
   cmd2=cmd2*chc_crt(hit,evade,crt)
   local cmd3=cmd1+cmd2
   cmd3=cmd3*num_hits(hit,multp,job,wp)
   return cmd3
 end
 -- FIM DA FUNÇÃO
 
 -- ESTA FUNÇÃO GERA A PROBABILIDADE DE UM PC SE CURAR DE SLEEP
 function chc_cure_sleep(maxhp)
    local cmd=maxhp
    if cmd>81 then
      cmd=81
    end
    return cmd/81
  end
  -- FIM DA FUNÇÃO
  
  -- ESTA FUNÇÃO EXTRAI O NÚMERO QUE ESTÁ NO BYTE
  function p(x)
    return memory.readbyte(x)
  end
  -- FIM DA FUNÇÃO
  
  -- O TESTE DE BATALHA INDICA SE ESTOU EM UM COMBATE
  -- teste_batalha==104 INDICA COMBATE
  function teste_batalha() 
    return p(0x0081)
  end
  -- FIM
  
  -- ESTE ENDEREÇO INDICA A QUANTIDADE INICIAL DE INIMIGOS
  -- 1<=num_inimigos_0<=9
  function num_inimigos_0()
    return p(0x6c93)
  end
  -- FIM
  
  -- ESTE ENDEREÇO INDICA A POSIÇÃO X DO DEDO NA SITUAÇÃO DE COMBATE
  -- QUANDO ESTE VALOR FOR 158 ESTÃO O DEDO ESTÁ NA POSIÇÃO INICIAL (EM FIGHT)
  function lugardodedo()
    return p(0x6ae4)
  end
  -- FIM
  function alicheck()
    local cmd=lugardodedo()
    cmd=(cmd+188)/24
    return cmd
  end
  
  -- ESTE É O SINCRONISMO
  -- QUANDO ESTE VALOR FOR 12 É UM INDICATIVO DE QUE PODE ACIONAR OS BOTÕES
  -- PARA SER USADO EM COMBATE
  function sincronismo()
    return p(0x01ef)
  end
  -- FIM
  
  -- ESTE ENDEREÇO INDICA QUAL O PC TEM A VEZ AGORA
  -- PARA SER USADO EM COMBATE
  function turnopc()
    return p(0x6aa9)+10
  end
  --FIM
  
  -- ESTE ENDEREÇO INDICA O NÚMERO DE I.HEAL QUE A EQUIPE TEM
  -- TEM QUE TOMAR CUIDADO POIS A QUANTIDADE DE I.HEAL SÓ É ATUALIZADA COM O FIM DA SEÇÃO DE DECISÃO
  function num_heal()
    return p(0x6039)
  end
  -- FIM
  
  -- ESTE ENDEREÇO INDICA QUEM VAI EMBOSCAR QUEM
  -- QUANDO ESTE VALOR FOR MENOR QUE 10, OS PC SERÃO EMBOSCADOS
  -- QUANDO ESTE VALOR FOR MAIOR QUE 90, OS BICHOS SERÃO EMBOSCADOS
  function ambush()
    return p(0x6856)
  end
  -- FIM
  
  -- ESTA É A SEÇÃO DE STATUS(DEAD,POISON ETC...)
  function status(pc)
    local cmd=0x6101
    cmd=p(cmd+(64*(pc-10)))
    return cmd
  end
  --FIM
  
  -- ESTA É A SEÇÃO QUE INDICA QUAL É A ARMA QUE ESTÁ NO INVENTÁRIO DO PC
  -- O PRIMEIRO ÍNDICE REPRESENTA QUAL PC EU QUERO OLHAR
  -- O SEGUNDO ÍNDICE REPRESENTA QUAL ESPAÇO DE MEMÓRIA ESTAMOS TRATANDO
  -- OS PC ESTÃO NUMERADOS DE 10 A 13
  -- OS ADR ESTÃO NUMERADOS DE 0 A 3
  function weapon(pc,adr)
    local cmd=0x6118
    cmd=p(cmd+(pc-10)*64+adr)
    return cmd
  end
  -- FIM
  
  -- ESTA É A SEÇÃO QUE INDICA QUAL É A ARMADURA QUE ESTÁ NO INVENTÁRIO DO PC
  -- O PRIMEIRO ÍNDICE REPRESENTA QUAL PC EU QUERO OLHAR
  -- O SEGUNDO ÍNDICE REPRESENTA QUAL ESPAÇO DE MEMÓRIA ESTAMOS TRATANDO
  -- OS PC ESTÃO NUMERADOS DE 10 A 13
  -- OS ADR ESTÃO NUMERADOS DE 0 A 3
  function armor(pc,adr)
    local cmd=0x611c
    cmd=p(cmd+(pc-10)*64+adr)
    return cmd
  end
  --FIM
  
  -- ESTA SEÇÃO INDICA O MULT DOS PCS
  -- ESTOU ESTUDANDO COLOCAR COMO MULT DOS BICHOS O PRÓPRIO NUMERO DE ATAQUES QUE ELES DÃO
  -- PARA COLOCAR ISTO É NECESSÁRIO USAR A MEMÓRIA INTERNA DO JOGO (PGR ROM)
  function multp(pc)
    local cmd=0x680b
    cmd=p(cmd+(pc-10)*18)
    return cmd
  end
  -- FIM
  
  -- ESTA É A SEÇÃO QUE INDICA O JOB DOS PC
  -- 0-> FIGHTER
  -- 1-> THIEF
  -- 2-> BLACK BELT
  -- 3-> RED MAGE
  -- 4-> WHITE MAGE
  -- 5-> BLACK MAGE
  -- 6-> KNIGHT
  -- 7-> NINJA
  -- 8-> MASTER
  -- 9-> RED WIZARD
  -- 10-> WHITE WIZARD
  -- 11-> BLACK WIZARD
  function job(pc)
    local cmd=0x6100
    cmd=p(cmd+64*(pc-10))
    return cmd
  end
  -- FIM
  
  -- ESTA SEÇÃO INDICA QUAL O HP ATUAL DE TODOS OS COMBATENTES
  -- ESTE VALOR É ATUALIZADO DEPOIS DE CADA PERDA OU GANHO DE HP
  -- SÓ É ATUALIZADO DEPOIS QUE A ANIMAÇÃO DO ATAQUE ACONTECER
  function hp(cbt)
    if cbt<=9 then
      local cmd=0x6bd5
      cmd=p(cmd+(cbt-1)*20)+p(cmd+(cbt-1)*20+1)*256
      return cmd
    else
      local cmd=0x610a
      cmd=p(cmd+(cbt-10)*64)+p(cmd+(cbt-10)*64+1)*256
      return cmd
    end
  end
  -- FIM
  
  -- ESTE É O HP MÁXIMO DOS COMBATENTES
  function hpmax(cbt)
    if cbt<=9 then
      local cmd=0x6be5
      cmd=p(cmd+(cbt-1)*20)+p(cmd+(cbt-1)*20+1)*256
      return cmd
    else
      local cmd=0x610c
      cmd=p(cmd+(cbt-10)*64)+p(cmd+(cbt-10)*64+1)*256
      return cmd
    end
  end
  -- FIM
  
  -- O HP GAP É O QUANTO FALTA PARA CHEGAR AO HP MÁXIMO
  function hpgap(cbt)
    return hpmax(cbt)-hp(cbt)
  end
  -- FIM
  
  -- ESTE É O ATAQUE DOS COMBATENTE
  function atk(cbt)
    if cbt<=9 then
      local cmd=0x6bde
      cmd=p(cmd+(cbt-1)*20)
      return cmd
    else
      local cmd=0x6120
      cmd=p(cmd+(cbt-10)*64)
      return cmd
    end
  end
  -- FIM
  
  -- ESTÁ É A DEFESA DOS COMBATENTES
  function def(cbt)
    if cbt<=9 then
      local cmd=0x6bd7
      cmd=p(cmd+(cbt-1)*20)
      return cmd
    else
      local cmd=0x6122
      cmd=p(cmd+(cbt-10)*64)
      return cmd
    end
  end
  -- FIM
  
  -- ESTE É O HIT DOS COMBATENTES
  function hit(pc)
    local cmd=0x6121
    cmd=p(cmd+64*(pc-10))
    return cmd
  end
  -- FIM
  
  -- ESTE É O EVADE DOS COMBATENTES
  function evade(cbt)
    if cbt<=9 then
      local cmd=0x6bdd
      cmd=p(cmd+(cbt-1)*20)
      return cmd
    else
      local cmd=0x6123
      cmd=p(cmd+(cbt-10)*64)
      return cmd
    end
  end
  -- FIM
  
  -- ESTE É O MORAL DOS COMBATENTES
  -- A MORAL É UM NÚMERO QUE INDICA SE O BICHO VAI QUERER FUGIR OU NÃO
  function moral(bicho)
    local cmd=0x6bdc
    return p(cmd+20*(bicho-1))
  end
  -- FIM
  
  -- ESTE É O DINHEIRO QUE UM BICHO ESPECÍFICO
  function gold(bicho)
    local cmd=0x6be2
    return p(cmd+20*(bicho-1))+256*p(cmd+20*(bicho-1))
  end
  -- FIM
  
  -- ESTA É UMA SOMA QUE INDICA QUANTO QUE SE PODE CONSEGUIR DE DINHEIRO COM A LUTA ATUAL
  function total_gold()
    local cmd=0
    for idx=1,9 do
      cmd=cmd+gold(idx)
    end
    return cmd
  end
  --FIM
  
  -- ESTA É A EXPERIENCIA QUE UM INIMIGO ESPECÍFICO PODE DAR AO FINAL DO COMBATE
  function exp(bicho)
    local cmd=0x6be0
    return p(cmd+20*(bicho-1))+256*p(cmd+20*(bicho-1))
  end
  -- FIM
  
  -- ESTA SEÇÃO INDICA A QUANTIDADE DE ALIADOS VIVOS
  function qtd_aliados()
    local cmd=0
  for idx=10,13 do
    if hp[idx]==0 then
      cmd=cmd
    else
      cmd=cmd+1
    end
  end
  return cmd
end
  --FIM
  
  -- EXPERIENCIA GANHA POR CADA PC
  function exp_ganha()
  local cmd=0
  for idx=1,9 do
    cmd=cmd+exp[idx]
  end
  cmd=math.floor(cmd/qtd_aliados())
  return cmd
  end
  -- FIM
  
  -- HP DA EQUIPE
  function hp_equipe()
    return media_geom(hp(10),hp(11),hp(12),hp(13))
  end
  -- FIM
  
  -- HP MAX DA EQUIPE
  function hp_max_equipe()
    return media_geom(hpmax(10),hpmax(11),hpmax(12),hpmax(13))
  end
  -- FIM
  
  --LEVEL DE UM ALIADO
  function level(pc)
    local cmd=0x6126
    return p((pc-10)*64+cmd)
  end
  --FIM
  
  --TESTA PARA VER SE O PC ESTÁ ARMADO OU NÃO
  --SE RETORNAR 1 O PC ESTÁ ARMADO
  --SE RETORNAR 0 O PC ESTÁ DESARMADO
  function wp_teste(pc)
    local cmd=0x6118
    cmd=cmd+(pc-10)*64
    if cmd >100 then
      return 1
    else
      return 0
    end
  end
  --FIM
  
  --ESTA FUNÇÃO DEFINE O CRÍTICO DE UM PERSONAGEM
  function critico(pc)
    if (job(pc)==2 or job(pc)==8) and wp_teste(pc)==0 then
      return level(pc)*2
    else
      return weapon(pc,0)
    end
  end
  --FIM
  
  --MOSTRA SE O BICHO ESTÁ VIVO OU NÃO
  --TEM QUE SER MELHORADA POIS INIMIGOS APARECEM BICHOS VIVOS QUE NÃO EXISTEM
  function inimigoVivo(bicho)
    local cmd=0x6bd9
    cmd=p(cmd+(bicho-1)*20)
    return cmd
  end
  --FIM
  
  --ESTA FUNÇÃO RETORNA O INIMIGO COM MAIOR ATK
  function maior_atk_inimigo()
    local tb1={}
    for idx=1,9 do
      if hp(idx)>0 then
        tb1[idx]=atk(idx)
      else
        tb1[idx]=0
      end
    end
    local cmd2=maior2(tb1[1],tb1[2],tb1[3],tb1[4],tb1[5],tb1[6],tb1[7],tb1[8],tb1[9])
    return cmd2
  end
  --FIM
  
  --INFORMA QUAL O BICHO O DEDO ESTÁ APONTANDO
  function idbicho()
    return p(0x6b7b)+1
  end
  --FIM
function jobdavez()
  return job(turnopc())
end  
  
  --FIM DAS FUNÇÕES
  
  --SELECIONA O ALVO
  function alvo(x)
    local cmd=0
    local cmd2=0
    while cmd==0 do
      if 1+p(0x6b7b)==x or cmd2==10 then
        a()
        fr(47)
        cmd=1
      else
        bx()
        fr(4)
        cmd2=cmd2+1
      end
    end
  end
--FIM


--COLOCA O DEDO NO PRIMEIRO ALVO VIVO
function fight()
  a()
  fr(5)
end
--FIM
function drink()
    bx()
    fr(4)
    bx()
    fr(4)
    a()
    fr(17)
  end
  function paciente()
    drink()
    a()
    fr(18) --Tem que ver se é par ou impar
    while alicheck()~=turnopc() do
      bx()
      fr(4)
    end
    a()
    fr(47)
  end
  function combat()
    if teste_batalha()==104 and lugardodedo()==158 and sincronismo()==12 then
      fr(20)
      local cmd=turnopc()
        cmd=job(cmd)
      if cmd==2 then
        black_belt()
      else
        err('combat()')
      end
    else
      fr(1)
    end
  end
  
  function black_belt()
    if (hpgap(turnopc())>30 or hp(turnopc())/hpmax(turnopc())<0.25) and num_heal()+10-turnopc()>0 then
      paciente()
    else
      fight()
      alvo(maior_atk_inimigo())
    end
  end
  
  while true do
    combat()
  end