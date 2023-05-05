require 'rspec'
require_relative '/home/joao-desktop/Documents/GitHub/Testes Técnicos - Missão Vaga/teste_tecnico_rails_4/app/services/question_2.rb'

RSpec.describe TesteTecnico4 do
  it 'Teste 01: contando corretamente o número de diamantes e areais' do
    str = ".....<<<>>>"

    teste = TesteTecnico4.new(str)
    result1 = teste.remove_diamantes_e_areias
    expect(result1).to eq("Diamantes extraídos = 3, Areias extraídas = 5")
  end

  it 'Teste 02: contando corretamente o número de diamantes e areais' do
    str = "<<.<<....>><>><.>.>.<<.>.<.>>>><>><>>"

    teste = TesteTecnico4.new(str)
    result1 = teste.remove_diamantes_e_areias
    expect(result1).to eq("Diamantes extraídos = 11, Areias extraídas = 11")
  end

  it 'Teste 03: contando corretamente o número de diamantes e areais' do
    str = "<><>.......<.><.><.><.>......"

    teste = TesteTecnico4.new(str)
    result1 = teste.remove_diamantes_e_areias
    expect(result1).to eq("Diamantes extraídos = 6, Areias extraídas = 17")
  end
end