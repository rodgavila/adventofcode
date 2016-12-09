require_relative 'problem.rb'

require 'set'

class Problem7 < Problem
  def parseIP(ip)
    $supernet_regex = '(\A|(?<=\]))(?<within>\w+)(\Z|(?=\[))'
    $hypernet_regex = '\[(?<hyper>\w+)\]'

    h = Hash.new
    h[:supernets] = ip.scan(/#{$supernet_regex}/).map! { |s| s[0] }
    h[:hypernets] = ip.scan(/#{$hypernet_regex}/).map! { |h| h[0] }
    h
  end

  def get_abas(ipo)
    $aba_regex = '(\w)(?!\1)(\w)(\1)'
    return_abas = Set.new
    if ipo[:supernets].any? { |s| s =~ /#{$aba_regex}/ }
      ipo[:supernets].each do |s|
        (0..(s.size-1)).each do |i|
          possible_aba = s[i..s.size-1]
          if possible_aba.size >= 3
            if possible_aba[0] == possible_aba[2] && possible_aba[0] != possible_aba[1]
              return_abas << possible_aba[0..2]
            end
          end
        end
      end
    end
    return_abas
  end

  def get_babs(ipo)
    $aba_regex = '(\w)(?!\1)(\w)(\1)'
    return_babs = Set.new
    if ipo[:hypernets].any? { |s| s =~ /#{$aba_regex}/ }
      ipo[:hypernets].each do |s|
        (0..(s.size-1)).each do |i|
          possible_aba = s[i..s.size-1]
          if possible_aba.size >= 3
            if possible_aba[0] == possible_aba[2] && possible_aba[0] != possible_aba[1]
              return_babs << possible_aba[0..2]
            end
          end
        end
      end
    end
    return_babs
  end
  
  def supportsTLS(ip)
    $abba_regex = '(\w)(?!\1)(\w)\2\1'
    ipo = parseIP(ip)
    ipo[:supernets].any? { |s| s =~ /#{$abba_regex}/ } && ipo[:hypernets].none? { |h| h =~ /#{$abba_regex}/ }
  end

  def supportsSSL(ip)
    ipo = parseIP(ip)

    abas = get_abas(ipo)
    babs = get_babs(ipo)
    babs.map! { |bab| "#{bab[1]}#{bab[0]}#{bab[1]}"}

    !(abas & babs).empty?
  end

  def part_a
    self.input.each_line.each.find_all { |line| supportsTLS(line) }.size
  end

  def part_b
    self.input.each_line.each.find_all { |line| supportsSSL(line) }.size
  end
end