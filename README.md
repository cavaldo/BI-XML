# BI-XML

# PROJEKT - INSTRUKCE

- Vytvořte XML dokumenty se všemi daty pro každou zadanou oblast (z
  https://www.cia.gov/library/publications/the-world-factbook/). Podrobnosti
  k výběru oblastí jsou v souboru "BI-XML-PROJEKT-VÝBĚR-ZADÁNÍ.txt". Pokud
  nezvládnete v dokumentu uvést všechna data o dané oblasti (např. protože
  se rozhodnete vytvářet XML manuálně), uveďte alespoň základní data u
  všech hlavních sekcí (tj. Introduction, Geography, atd.). Dále spojte XML
  dokumenty pro jednotlivé oblasti do jediného dokumentu pomocí DTD.

- Vytvořte schema pomocí DTD i RelaxNG pro validaci struktury XML
  dokumentů. V RelaxNG schema se pokuste využít alespoň některé možnosti
  pokročilejší validace co jazyk nabízí navíc oproti DTD.

- Pomocí XSLT vygenerujte (X)HTML výstupy (tj. souhrný index obsahující
  odkazy na jednotlivé oblasti a samostatnou stránku pro každou oblast
  obsahující detailní informace).

- Pomocí XSL-FO vygenerujte PDF výstup (tj. dokument obsahující odkazy na
  jednotlivé oblasti a detailní informace o každé oblasti).

- Buď vygenerujte ePub výstup (tj. ebook připravený k načtení v software
  podporujícím ePub formát), nebo do (X)HTML a PDF výstupů přidejte obrázky
  (stačí vlajky nebo mapy a podobně), navigaci pro sekce s detailními
  informacemi (stačí pro hlavní sekce jako "Introduction", "Geography",
  atd.) a rozšiřte základní formátování aby byly výstupy více přehledné
  (použijte CSS a možnosti formátování v XSL-FO včetně číslování stran a
  přidání záhlaví či zápatí).

- Schema (DTD i RelaxNG), stylesheety (XSLT i XSL-FO) a další části
  projektu tvořte adekvátně obecné aby byla zajištěna funkčnost pro všechny
  zadané oblasti. Všechny XML dokumenty musí být "well-formed" + "valid". I
  základní výstupy bez rozšířeného formátování musí být adekvátně čitelné
  (tj. alespoň by mělo jít rozlišit nadpisy a odstavce, případně i další
  prvky jako seznamy, odkazy, atd.).

- Projekt tvořte pomocí veřejně přístupného GIT repozitáře a finální
  soubory projektu (bez použitého software) zabalte do ZIP nebo TAR archivu
  a pošlete na email vyučujícího spolu s odkazem na GIT repozitář.

- Do archivu i repozitáře také přidejte informace o projektu dle zadání v
  souboru "BI-XML-PROJEKT-PREZENTACE.txt".
  
  
 # Použité příkazy:
 - Spojení jednotlivých oblastí do jednoho dokumentu.
 
    xmllint --noent joinFiles.xml > countries.xml
 
 - Validace souborů pomocí dtd (název souboru př. Countries/Slovakia.xml)
 
    xmllint --noout --dtdvalid validation/validation.dtd -název souboru-
 
 - Validace pomocí relaxng
 
    xmllint -noout -relaxng validation/validation.rng -název souboru-
 
 - Generování (X)HTML souborů (vstupní s. př.: Countries/Finland.xml výstupní soubor př.: "html/finland.html")
 
    java -jar SaxonHE9-9-1-5J/saxon9he.jar -vstupní xml- transformation/countryTransform.xsl -o:"-název výstupního souboru-"
 
 - Generování indexu
 
    java -jar SaxonHE9-9-1-5J/saxon9he.jar countries.xml transformation/indexTransform.xsl -o:"html/index.html"
 
 - Generování pdf souboru
 
    java -jar SaxonHE9-9-1-5J/saxon9he.jar countries.xml transformation/pdfTransform.xsl -o:"pdf.fo"    
 fop -fo pdf.fo -pdf countries.pdf
 
