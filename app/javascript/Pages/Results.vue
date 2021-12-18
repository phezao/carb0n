<template>
  <div class="pt-48 mx-auto text-center max-w-6xl">
    <div class="mb-8">
      <h4 class="font-semibold text-2xl mb-4">Sua pegada de carbono é de</h4>
      <h1 class="text-primary font-bold text-8xl mb-4">{{totalCarbonFootprint}}</h1>
      <p class="text-xl">toneladas de CO2eq por ano</p>
    </div>
    <img :src="imagePath('clouds.png')" alt="" class="hidden md:block absolute top-96 -left-32 w-1/4">
    <img :src="imagePath('clouds.png')" alt="" class="hidden md:block absolute top-28 -right-36 cloud-inverted w-1/4">
    <button class="btn btn-primary">Neutralizar por R$ 32,92/mês</button>
    <div class="flex justify-center gap-24 mt-48 mb-24 flex-col md:flex-row items-center px-4">
      <apexchart :width="graphWidth(400)" type="bar" :options="carbonFootprintChartWorld.options" :series="carbonFootprintChartWorld.series"></apexchart>
      <div class="bg-accent py-6 px-10 rounded-xl max-w-xs max-h-56">
        <p class="mb-5 font-semibold text-sm">Se todos tivessem o mesmo estilo de vida que você, a temperatura do planeta se elevaria em 1,5°C em</p>
        <h4 class="text-primary font-bold text-4xl">{{yearsToWarm}} anos</h4>
      </div>
    </div>
    <div class="mb-8">
      <h3 class="text-xl font-semibold">Essa quantidade de gases de efeito estufa equivale a</h3>
      <div class="flex md:flex-row flex-col gap-16 md:justify-between mt-12 md:mt-24 items-center md:items-baseline">
        <div class="flex flex-col items-center text-center w-48">
          <img :src="imagePath('tree.png')" alt="tree" class="w-5/6 mb-4">
          <p>{{treesCutYear}}</p>
        </div>
        <div class="flex flex-col items-center text-center w-48">
          <img :src="imagePath('hamburguer.png')" alt="burguer" class="w-5/6 mb-4">
          <p>{{burgersEaten}}</p>
        </div>
        <div class="flex flex-col items-center text-center w-48">
          <img :src="imagePath('baby-car.png')" alt="car" class="w-5/6">
          <p>{{kmDriven}}</p>
        </div>
      </div>
    </div>
    <div class="my-24 md:flex flex-col items-center px-4">
      <h3 class="text-xl font-semibold mb-4">Sua pegada de carbono vs média do Brasil, por categoria</h3>
      <apexchart :width="graphWidth(800, 300)" height="300" type="bar" :options="carbonFootprintChartComparison.options" :series="carbonFootprintChartComparison.series"></apexchart>
    </div>
    <div class="flex justify-center gap-16 my-24 flex-col md:flex-row">
      <div class="flex flex-col gap-20 items-center">
        <div class="bg-accent rounded-xl px-12 py-8 md:mt-12 compensa-card">
          <h4 class="text-xl mb-4 font-semibold leading-8">Compense sua pegada de carbono</h4>
          <p class="mb-8">através de um plano mensal de</p>
          <h1 class="text-4xl text-primary font-bold">R$ 32,92</h1>
          <button class="btn btn-primary mt-8">Neutralizar</button>
          <p class="text-xs mt-12 leading-5">Você pode cancelar seu plano a qualquer momento</p>
        </div>
        <div class="w-2/3 hidden md:block">
          <img :src="imagePath('earth-globe.png')" alt="" class="w-full">
        </div>
      </div>
      <div class="max-w-sm text-left beneficios px-4">
        <h4 class="text-xl font-semibold mb-5">Como assinante <span class="text-primary">breeze</span>, você pode</h4>
        <h5>Escolher qual causa socioambiental quer financiar</h5>
        <p>Nossos projetos são agrupados por causa (energia sustentável, reflorestamento, desmatamento evitado, gestão de resíduos, ver outro), e cada pacote abrange iniciativas de diferentes países</p>
        <h5>Colaborar com a geração de benefícios para as comunidades locais</h5>
        <p>Além de serem boas para o planeta, as iniciativas apoiadas pela breeze geram benefícios também para a sociedade e para as comunidades locais</p>
        <h5>Acompanhar e gerenciar suas emissões</h5>
        <p>Você pode responder a calculadora breeze quando e quantas vezes quiser. Seus resultados ficarão guardados para que você acompanhe sua evolução ao longo do tempo</p>
        <h5>Receber dicas de como ir além</h5>
        <p>Neutralizar não é o suficiente: precisamos reduzir! Mas também sabemos que o “como” pode muitas vezes não ser tão trivial. Por isso, te indicamos os caminhos para minimizar suas emissões e, então, neutralizar apenas as inevitáveis</p>
        <h5>Ter acesso a benefícios de nossos parceiros</h5>
        <p>Consumidores conscientes precisam de empresas conscientes. Já pensou em ter descontos e outros benefícios de empresas que se importam com nosso planeta? Vem com a breeze!</p>
        <h5>Ficar por dentro dos projetos apoiados e seus resultados</h5>
        <p>Transparente como a brisa! Mensalmente, você receberá atualizações sobre o status e os resultados dos projetos apoiados</p>
      </div>
    </div>
    <div class="hidden md:block projects">
      <div class="projects-inside text-white text-center flex flex-col items-center py-12">
        <h1 class="font-bold text-2xl max-w-2xl mb-8">Ajude a financiar projetos socioambientais ao redor de todo o mundo</h1>
        <p class="max-w-2xl leading-7">As iniciativas apoiadas pela breeze são certificadas pela Verra ou pela Gold Standard, consideradas as entidades com os padrões climáticos mais elevados do mundo, e são selecionadas criteriosamente para garantir que os impactos prometidos serão de fato cumpridos</p>
        <div class="flex gap-12 mt-8">
          <button class="btn btn-primary btn-sm btn-wide rounded-primary normal-case">Conheça nossos projetos</button>
          <button class="btn btn-primary btn-sm btn-wide rounded-primary normal-case">Saiba como escolhemos</button>
        </div>
      </div>
    </div>
    <div class="md:my-32 my-24 px-4">
      <h1 class="text-4xl font-semibold text-left mb-6">Já quer começar a reduzir sua pegada?</h1>
      <h6 class="max-w-5xl text-left text-xl leading-9 mb-16">Você não precisa esperar se tornar carbono neutro para começar a reduzir suas emissões. Aqui estão algumas dicas de como você pode dar os primeiros passos:</h6>
      <div class="grid md:grid-cols-3 md:grid-rows-2 grid-cols-2 grid-rows-3 text-left dicas-reducao md:my-8 gap-8">
        <div>
          <div class="w-16">
            <img class="w-full" :src="imagePath('house.png')" alt="">
          </div>
          <h6>Habitação</h6>
          <p>Dê a destinação correta para seus resíduos: compostagem para orgânicos, reciclagem para recicláveis e aterro somente para o restante</p>
        </div>
        <div>
          <div class="w-16">
            <img class="w-full" :src="imagePath('boxes.png')" alt="">
          </div>
          <h6>Bens e serviços</h6>
          <p>Reduza a quantidade de lixo que você produz utilizando os 4Rs (repensar, reduzir, reutilizar e reciclar)</p>
        </div>
        <div>
          <div class="w-16">
            <img class="w-full" :src="imagePath('mountain-bike.png')" alt="">
          </div>
          <h6>Transportes</h6>
          <p>Sempre que possível, opte por se locomover de bicicleta ou a pé. Assim, você economiza nas emissões e mantém as atividades físicas em dia</p>
        </div>
        <div>
          <div class="w-16">
            <img class="w-full" :src="imagePath('broccoli.png')" alt="">
          </div>
          <h6>Alimetação</h6>
          <p>Diminua seu consumo de carne e outros alimentos de origem animal e compre seus alimentos de produtores locais</p>
        </div>
        <div>
          <div class="w-12">
            <img class="w-full" :src="imagePath('lightning.png')" alt="">
          </div>
          <h6>Energia</h6>
          <p>Utilize energia limpa através da instalação de painéis solares, por exemplo</p>
        </div>
        <div class="bg-accent py-6 px-4 rounded-xl text-center mx-8 hidden md:block">
          <h3 class="text-xl font-semibold mb-4 w-32 mx-auto">E isso é só o começo!</h3>
          <p class="w-56 mx-auto">Neutralizando com a breeze, você recebe dicas e incentivos de redução específicos para o seu estilo de vida</p>
        </div>
      </div>
      <button class="btn btn-primary md:mt-12">Neutralizar por R$ 32,92/mês</button>
   </div>
  </div>
</template>

<script>

  export default {
    props: ['carbon_footprint', 'transport_footprint'],
    created(){
      if (window.outerWidth < 425){
        return this.isMobile = true;
      }
    },
    data() {
      return {
        isMobile: false,
        carbonFootprintChartWorld: {
          options: {
            chart: {
              id: 'emissoes_pessoais_vs_mundo',
            },
            dataLabels: {
              enabled: true,
              offsetY: -20,
              style: {
                fontWeight: 'base',
                colors: ["#222"]
              }
            },
            xaxis: {
              categories: ['Você', 'Brasil', 'EUA', 'Mundo'],
            },
            stroke: {
              show: false
            },
            yaxis: {
              show: false,
            },
            colors: ['#1B69E4'],
            plotOptions: {
              bar: {
                borderRadius: 20,
                columnWidth: '80%',
                barHeight: '100%',
                dataLabels: {
                  position: 'top'
                }
              }
            },
          },
          series: [{
            name: 'Emissões de CO2 anuais',
            data: [(Math.round(this.carbon_footprint * 10) / 10), 4.9, 18.3, 4.9]
          }]
        },
        carbonFootprintChartComparison: {
          options: {
            chart: {
              id: 'emissoes_pessoais_vs_brasil',
            },
            dataLabels: {
              enabled: true,
              offsetY: -20,
              style: {
                fontWeight: 'base',
                colors: ["#222"]
              }
            },
            xaxis: {
              categories: ['Habitação', 'Bens e serviços', 'Transporte', 'Alimentação', 'Energia']
            },
            colors: ['#1B69E4', '#CADBF7'],
            yaxis: {
              show: false,
            },
            states: {
              hover: {
                filter: {
                  type: 'none'
                }
              }
            },
            plotOptions: {
              bar: {
                borderRadius: 10,
                columnWidth: '80%',
                barHeight: '100%',
                dataLabels: {
                  position: 'top'
                }
              }
            },
          },
          series: [
            {
              name: 'Você',
              data: [2.2, 1.1, (Math.round(this.transport_footprint * 10) / 10), 0.4, 0.2 ]
            },
            {
              name: 'Brasil',
              data: [0.9, 1.2, 0.5, 2.1, 0.2]
            }
          ]
        }
      }
    },
    computed: {
      totalCarbonFootprint(){
        return Math.round(this.carbon_footprint * 10) / 10
      },
      treesCutYear(){
        const trees = this.carbon_footprint / 1.2;
        const result = Math.round(trees);
        if (result > 1){
          return `${result} árvores cortadas`;
        }
        return `${result} árvore cortada`;
      },
      burgersEaten(){
        const burgers = (this.carbon_footprint * 1000) / 1.2;
        const result = Math.round(burgers);
        return `${result} hambúrgueres comidos`
      },
      kmDriven(){
        const milesDriven = (this.carbon_footprint * 1000 * 22) / 8.887
        const resultKm = milesDriven / 0.621371
        const result = Math.round(resultKm);

        return `${result} km rodados em um carro médio`
      },
      yearsToWarm(){
        const carbonBudget = 500;
        const worldPopulation = 10500000000;
        const gigatonConversor = 1102311310.9244;

        const years = carbonBudget/((this.totalCarbonFootprint * worldPopulation)/gigatonConversor);

        const result = Math.floor(years);

        return result
      }
    },
    methods: {
      graphWidth(value, anotherDimension){
        if (this.isMobile){
          return anotherDimension || value / 1.5;
        }
        return value;
      }
    }
  }
</script>

<style lang="scss" scoped>
  h5{
    font-weight: 600;
    margin-bottom: 0.25rem;
  }

  .beneficios{
    position: relative;
  }

  .beneficios > p {
    font-size: 0.85rem;
    margin-bottom: 1.25rem;
  }

  .compensa-card {
    max-height: 420px;
    max-width:  300px;
  }
  .dicas-reducao{
    h6{
      font-weight: 600;
      margin-bottom: 0.25rem;
    }
  }
  .projects{
    position: relative;
    margin-left: -144px;
    margin-right: -144px;
  }
  .projects::before{
    content: '';
    background-image: url('../images/backgroundImage.jpg');
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;
    width: 100%;
    height: 100%;
    filter: brightness(60%);
    position: absolute;
    top: 0;
    left: 0;
  }
  .projects-inside{
    position: relative;
  }
  .cloud-inverted{
    transform: scaleX(-1);
  }
</style>
