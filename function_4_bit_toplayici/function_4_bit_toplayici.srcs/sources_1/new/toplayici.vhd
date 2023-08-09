library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity toplayici is
    Port ( i_elde : in STD_LOGIC;
           i_giris1 : in STD_LOGIC_VECTOR (3 downto 0);
           i_giris2 : in STD_LOGIC_VECTOR (3 downto 0);
           o_toplam : out STD_LOGIC_VECTOR (3 downto 0);
           o_elde : out STD_LOGIC);
end toplayici;

architecture function_toplayici of toplayici is

function toplayici_4bit(i_giris1, i_giris2 : std_logic_vector(3 downto 0);
                        i_elde : std_logic) return std_logic_vector is
     variable v_elde : std_logic;
     variable v_toplam : std_logic_vector(4 downto 0);
begin
    v_elde := i_elde;
    v_toplam := "00000";
    
    for_loop: for k in 0 to 3 loop
        v_toplam(k) := i_giris1(k) xor i_giris2(k) xor i_elde;
        v_elde := (v_elde and i_giris1(k)) or (v_elde and i_giris2(k)) or (i_giris1(k) and i_giris2(k));
    end loop;
    
    v_toplam(4) := v_elde;
    return v_toplam;
end function toplayici_4bit;

signal s_toplam : std_logic_vector(4 downto 0) := "00000";
begin
    
    s_toplam <= toplayici_4bit(i_giris1, i_giris2, i_elde);
    o_toplam <= s_toplam(3 downto 0);
    o_elde <= s_toplam(4);

end function_toplayici;
