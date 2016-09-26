//Código Scilab para realizar regressão exponencial
//via método dos mínimos quadrados
//Desenvolvido por Gabriel Marins da Costa

//Função que representa o modelo
function y = model(x,c)
    //c representa o vetor dos coeficientes
    //c = [A,B]
    //A * exp(B*x)
    y = c(1)*exp(c(2)*x);
endfunction
//Função para encontrar o erro absoluto
function e = erro(c,z)
    x = z(1); y = z(2);
    e = y - model(x,c);
endfunction

x = [5 6 7];
y = [0.7 0.8 2.1];

//Plota resultados originais
plot(x,y,'r+')
//Prepara vetor auxiliar com duas linhas
z = [x  ;  y];
//Chute inicial de parâmetros
c0 = [2 2]';
//Copt é para ser o melhor resultado e err é o erro
[copt,err] = datafit(erro,z,c0);

//Checar o resultado da regressão
x = linspace(0,10,256);
y = model(x,copt);
plot(x,y)


