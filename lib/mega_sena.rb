class MegaSena
  attr_accessor :numeros

  def initialize(numeros = (1..60).to_a)
    @numeros = numeros
  end

  def jogo_normal(qtd_jogos)
    mistura_numeros(numeros, qtd_jogos)

    total(qtd_jogos)
  end

  def jogo_esperto(qtd_jogos)
    mega = [0o4, 0o5, 0o7, 12, 13, 16, 17, 23, 24, 29, 30, 32, 33, 37, 38, 41, 42, 43, 47, 49, 50, 51, 53, 54, 58, 59]

    mistura_numeros(mega, qtd_jogos)

    total(qtd_jogos)
  end

  def jogo_mais_esperto(qtd_jogos)
    range_normal = numeros.shuffle
    range_seleto = [0o4, 0o5, 0o7, 12, 13, 16, 17, 23, 24, 29, 30, 32, 33, 37, 38, 41, 42, 43, 47, 49, 50, 51, 53, 54, 58, 59].shuffle
    diff_range = range_normal - range_seleto

    qtd_jogos.times do
      mega = range_seleto.sample(4) + diff_range.sample(2)
      p mega[0..5].sort.map { |n| n < 10 ? "0#{n}" : n.to_s }.join(' - ')
    end
    total(qtd_jogos)
  end

  def mistura_numeros(mega, qtd_jogos)
    qtd_jogos.times do
      mega = mega.shuffle
      p mega[0..5].sort.map { |n| n < 10 ? "0#{n}" : n.to_s }.join(' - ')
    end
  end

  def total(qtd_jogos)
    puts '========================================='
    puts "TOTAL A PAGAR R$ #{qtd_jogos * 3.5}"
    puts '========================================='
  end
end

# meu_jogo = MegaSena.new
# meu_jogo.jogo_normal(4)
# meu_jogo.jogo_esperto(2)
# meu_jogo.jogo_mais_esperto(2)
