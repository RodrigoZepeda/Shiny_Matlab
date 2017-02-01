function [] = modelosir(alpha, beta, s0, i0, r0)
%Modelo SIR que cuantifica la cantidad de susceptibles,
%infectados y recuperados en una epidemia.
%Para ello sigue las relaciones de recurrencia:
%S_n  = S_{n-1} - alpha S_{n-1} I_{n-1},
%I_n & = I_{n-1} + alpha S_{n-1} I_{n-1} - beta I_{n-1},
%R_n & = beta I_{n-1}.
%
%INPUT:
%alpha .- Tasa de infección.
%beta  .- Tasa de recuperación.
%s0    .- Número inicial de susceptibles
%i0    .- Número inicial de infectados
%r0    .- Número inicial de recuperados
%
%OUTPUT:
%s     .- Vector con número de susceptibles desde s_0 hasta s_n
%i     .- Vector con número de infectados desde i_0 hasta i_n
%r     .- Vector con número de recuperados desde r_0 hasta r_n
%

%Número de días a estimar
n = 20;

%Inicializamos los vectores
s = zeros(n + 1, 1);
i = zeros(n + 1, 1);
r = zeros(n + 1, 1);

%Ponemos los valores iniciales
s(1) = s0;
i(1) = i0;
r(1) = r0;

%Creamos un for que calcule la cantidad de individuos
for j = 2:(n+1)
    s(j) = s(j-1) - alpha*s(j-1)*i(j-1);
    i(j) = i(j-1) + alpha*s(j-1)*i(j-1) - beta*i(j-1);
    r(j) = beta*i(j-1);
end

%Graficamos
plot(0:n, [s, i, r])
print('modelo.png','-dpng');
end