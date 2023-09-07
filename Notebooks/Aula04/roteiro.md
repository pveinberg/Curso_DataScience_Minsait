MACHINE LEARNING
================

# Supervisionado

## Divisão dos dados
Refere-se ao processo de dividir os dados em conjuntos de treinamento, validação e teste.

1. Divisão dos dados usando `from sklearn.model_selection import train_test_split`
2. __Amostragem:__ É importante garantir que os dados sejam divididos de forma aleatória e estratificada (mantem o
mesmo número de objetos para cada classe, proporcional ao conjunto original), a fim de evitar a
introdução de viés nos modelos.
3. __Balanceamento dos dados:__ Refere-se ao processo de equilibrar a distribuição de classes nas amostras de dados.

## Métricas de avaliação
Métricas que refletem a qualidade de um modelo, portanto se forem mal escolhidas, será impossível
avaliar se o modelo de fato está atendendo os requisitos necessários. Ademais, também são utilizadas
para realizar comparação de modelos.

### Métricas de avaliação de modelos de classificação [binária]
(k-NN Classifier, por exemplo)

Um modelo de classificação binária tem como objetivo decidir em qual classe uma nova observação pertence dentre duas classes possíveis. Em geral as duas classes, denominadas de positiva (P) e negativa (N), indicam a ocorrência ou não de um determinado evento. Um exemplo seria classificar se um determinado paciente possui uma determinada doença (positivo) ou não (negativo).

A avaliação de um modelo de classificação é feita a partir da comparação entre as classes preditas pelo modelo e as classes verdadeiras de cada exemplo. Todas as métricas de classificação têm como objetivo comum medir quão distante o modelo está da classificação perfeita, porém fazem isto de formas diferentes.

#### Matriz de confusão 
[Diego Mariano](https://diegomariano.com/metricas-de-avaliacao-em-machine-learning/)

![matriz_confusao](./../../docs/imgs/matriz_confusao.png)

Método|Fórmula
------|------
Sensibilidade|VP / (VP+FN)|
Especificidade|VN / (FP+VN)|
Acurácia|(VP+VN) / N|
Precisão|VP / (VP+FP)|
F-score|2 x (PxS) / (P+S)|

##### Acurácia
A acurácia (accuracy ou ACC) é considerada uma das métricas mais simples e importantes. Ela avalia simplesmente o percentual de acertos, ou seja, ela pode ser obtida pela razão entre a quantidade de acertos e o total de entradas.

##### Sensibilidade
Outra métrica que pode ser utilizada é a sensibilidade (também conhecida como recall ou revocação). Essa métrica avalia a capacidade do método de detectar com sucesso resultados classificados como positivos. 

##### Especificidade
Por outro lado, a especificidade avalia a capacidade do método de detectar resultados negativos.

##### Precisão
A precisão é uma métrica que avalia a quantidade de verdadeiros positivos sobre a soma de todos os valores positivos.

##### F1-score
F–measure, F-score ou score F1 é uma média harmônica calculada com base na precisão e na revocação.

### Métricas de avaliação de modelos de regressão

#### R2 Score
Medida estatística que representa a proporção da variância para uma variável dependente que é explicada por uma variável independente em um modelo de regressão. Enquanto a correlação explica a força da relação entre uma variável independente e uma variável dependente, o R-quadrado explica até que ponto a variância de uma variável explica a variância da segunda variável. Portanto, se o R2 de um modelo for 0,50, aproximadamente metade da variação observada pode ser explicada pelas entradas do modelo, logo __R2 Score, normalmente, está entre 0 e 1, quanto mais próximo de 1, melhor o ajuste da regressão__.

#### Erro médio (ME)
Média da diferença do realizado e do previsto.

#### Erro médio absoluto (MAE)
Média da diferença absoluta do realizado e do previsto.

#### Erro médio quadrático (RMSE)
O desvio da amostra da diferença entre o previsto e o realizado.

#### Erro de porcentagem absoluta média (MAPE)
Diferença absoluta percentual de erro.

## Modelos de regressão
Para o funcionamento do modelo de regressão serão fornecidas informações na forma de variáveis atributos e o modelo estimará o valor da variável resposta usando dados de referência durante o treinamento. Lembrando que, para o caso da Regressão, __o tipo de resposta esperado na saída será um valor contínuo representativo de acordo com a variável resposta__. Especificamente quando se trata de Regressões Lineares, a inferência feita sobre a relação entre as variáveis é que pode ser descrita por uma equação de reta.

### Regressão linear
Na regressão linear simples, tem-se um conjunto de dados formado por **um único atributo X e a variável resposta Y**. O modelo vai procurar estabelecer a melhor equação de reta que descreva o conjunto de dados.

![regressao_linear_simples](./../../docs/imgs/regressao_linear_simples.png)

[Exemplo 01](./regressao_linear.ipynb)

Para validar utiilizar [métricas de avaliação de modelos de regressão](#métricas-de-avaliação-de-modelos-de-regressão)

## Classificação: Algoritmo k-NN
__Vizinhos mais próximos__

* Classifica um novo objeto com base nos exemplos do conjunto de treinamento que são próximos a ele;
* Pode ser utilizado tanto para classificação quanto para regressão;
* Tem variações definidas (principalmente) pelo número de vizinhos considerados.

Para validar, utilizar [métricas de avaliação de modelos de classificação](#métricas-de-avaliação-de-modelos-de-classificação-binária)

### Tipos de distâncias
![distancias](./images/distancias.jpg)

### Calculando distância euclideana usando a biblioteca `DistanceMetric`
![knn](./../../docs/imgs/knn.png)

[Exemplo de código](./knn.ipynb)

## Classificação: Árvore de decisão
O principal objetivo do algoritmo árvore de decisão é encontrar o atributo ou variável independente que melhor realiza a divisão dos dados.Uma árvore de decisão, utiliza a técnica de dividir para conquistar:
* Um problema complexo é decomposto em subproblemas mais simples;
* Recursivamente a mesma estratégia é aplicada cada subproblema.

### Critérios para escolha dos atributos

#### Índice de Gini
**É uma medida da impureza de um nó.** Esta medida quantifica a quantidade de vezes que um elemento escolhido aleatoriamente do conjunto de dados seria rotulado de maneira incorreta se fosse rotulado aleatoriamente de acordo com a distribuição de rótulos do subconjunto. É a maneira mais popular e fácil de dividir uma árvore de decisão e funciona apenas com alvos categóricos, pois faz apenas divisões binárias. **Quanto menor a Impureza (Gini), maior a homogeneidade do nó.** A Impureza (Gini) de um nó puro (mesma classe) é igual a zero.

#### Entropia
Representa a **falta de uniformidade** ou uma medida de aleatoriedade nos dados. **Quanto mais alta a entropia, mais caótico e misturados estão os dados** e quanto menor a entropia, mais uniforme e homogênea está o conjunto de dados.

#### Ganho de informação
É uma propriedade estatística que **mede quão bem um determinado atributo separa os exemplos de treinamento de acordo com sua classificação** alvo ou rótulo. Em outras palavras, o ganho de informação **representa a informação aprendida sobre os rótulos** quando dividimos uma região do espaço em duas sub-regiões de acordo com um critério de divisão como a entropia ou impureza (gini), citadas acima.

# Não supervisionados

* Baseia-se na separação de clusters baseados em catacterísticas. 
* A clusterização é centrada em pontos e o critério é que os elementos devem estar mais perto do seu cetro do que dos centros dos outros clusters. 
* O centro de um cluster pode ser um centróide, como a média aritmética dos pontos do cluster.
  
__Exemplo de clusterização__

![clusterizacao](./images/clustering.png)

## Características principais

### Matriz de similaridade

Representa a similaridade ou a dissimilaridade entre cada par de objetos.

* __Similaridade:__ uma das medidas mais usadas é a __correlação__.
* __Dissimilaridade:__ uma medida comum é a __distância euclideana__. 

### Validação 

* Determina se os clusters são significativos, ou seja, se a solução é representativa para o conjunto de dados analisado.
* Determina o número apropriado de clusters para um conjunto de dados, que em geral não é conhecido previamente.

## K-médias (K-means)

* Um dos principais algoritmos de clusterização. 
* Simplees __interoperabilidade__
* Boa __eficiência computacional__

### Algoritmos

1. __Definição dos Centroides:__ Supondo que deve-se separar os dados em K grupos, para inicializar o modelo define-se K centroides iniciais aleatoriamente, que serão utilizados para os cálculos do modelo;
2. __Agrupamentos dos K grupos:__ Dado os K grupos utilizados no modelo, cada uma das observações será associada ao centroide mais próximo utilizando de cálculos de distância euclidiana;
3. __Reposicionamento dos Centroides:__ Separados as observações em cada um dos K grupos, a partir das observações recalcula-se a posição dos centroides como a média da posição das observações dentro de determinado grupo;
4. __Processo Iterativo:__ Os passos 2 e 3 serão repetidos até que o modelo considere que não houve mais alterações na posição dos centroides, levando em considerando uma margem de erro para as variações do posicionamento do centroide, ou mesmo quando o número máximo de iterações é atingido.

### Método do cotovelo

A ideia é executar o K-Means para várias quantidades diferentes de clusters e dizer qual dessas quantidades é o número ótimo de clusters.

Como o K-Means calcula a distância das observações até o centro do agrupamento que ela pertence, o ideal é que essa distância seja a menor viável. Matematicamente falando, nós estamos buscando uma quantidade de agrupamentos em que a soma dos quadrados intra-clusters (ou do inglês within-clusters sum-of-squares ou _wcss_) seja a menor possível, sendo zero o resultado ótimo.

__The Elbow Method__

Na representação abaixo podemos ver que após 3 não há diminuição significativa no WCSS, então
3 é o melhor aqui. Portanto, há um formato de cotovelo que se forma e geralmente é uma boa ideia
escolher o número onde esse cotovelo é formado. Muitas vezes o gráfico não seria tão intuitivo, mas
com a prática fica mais fácil.

![elbow_method](./images/elbow_method.png)

### Método silhueta
 
Silhueta refere-se a um __método estatístico utilizado para interpretação e validação de consistência dentro dos clusters__ formados. O valor da silhueta (também chamado de coeficiente de silhueta) é uma medida de quão semelhante um objeto é ao seu próprio cluster __(coesão)__, em comparação com outros clusters __(separação)__. Este valor pode ser calculado com qualquer métrica de distância, como a euclidiana ou a de Manhattan. 

Os coeficientes de silhueta variam de -1 a +1. 

* Os valores **próximos a +1 (alto grau de coesão)** indicam que a amostra está longe dos clusters vizinhos, ou seja, indica que o objeto está no grupo que deveria se encontrar e que não deveria ser agrupado aos grupos vizinhos. 
* **Valores negativos** indicam que essas amostras podem ter sido atribuídas ao **cluster errado**.
* Um **valor zero** indica que a amostra está dentro ou muito perto do **limite de decisão entre dois clusters** vizinhos. 

**O método**

1. Para cada ponto _i_, calcula-se a distância intra-cluster, denominada de _a(i)_. Esta distância é calculada através da distância média de _i_ para todos os outros pontos que foram agrupados dentro deste mesmo cluster.
2. Para cada ponto _i_, calcula-se a distância inter-cluster, denominada _b(i)_. Esta distância é calculada através da distância média de _i_ para todos os outros pontos que foram agrupados em clusters distintos do ponto _i_. Assim, o valor de _b(i)_ será denominado pela menor distância média de _i_ para todos os pontos pertencentes a outros grupos, do qual _i_ não é um membro. O grupo com essa menor dissimilaridade média é o "grupo vizinho" de _i_.
3. Para cada ponto _i_, o coeficiente de silhueta pode ser descrito pela equação abaixo. Ademais, uma ilustração correspondente aos elementos envolvidos no cálculo de _s(i)_ pode ser visualizada na figura abaixo.

![metodo_silhueta](./images/silhueta.png)

Semelhante ao [método anterior](#k-médias-k-means), escolhemos um intervalo de valores candidatos de _k_ e, em seguida, treinamos o agrupamento K-Means para cada um dos valores de _k_. Para cada
modelo de agrupamento k-Means representamos os coeficientes de silhueta em um gráfico e observamos as flutuações de cada cluster.

![silhouette_kmeans](./images/silhouette_kmeans.png)

![analyses](./images/sphx_glr_plot_kmeans_silhouette_analysis_004.png)


# Bibliografia
* [Thaís Ratis - Curso DataScience](https://github.com/thaisratis/Curso_DataScience_Minsait)
* [Diego Mariano](https://diegomariano.com/metricas-de-avaliacao-em-machine-learning/)
* [Steps to Solve a Data Science Problem](https://thecleverprogrammer.com/2023/09/05/steps-to-solve-a-data-science-problem/)
