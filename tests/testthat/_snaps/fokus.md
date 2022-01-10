# Exported functions return correct default values

    Code
      proposal_arguments()
    Output
      # A tibble: 6 x 5
        de.long                de.short              en.long                  nr side 
        <chr>                  <chr>                 <chr>                 <int> <chr>
      1 Eine Erhöhung der Ver~ Vermögenssteuer brin~ An increase in wealt~     1 pro  
      2 Eine Erhöhung der Ver~ Wohlhabende finden i~ An increase in wealt~     1 cont~
      3 Die Reichen wurden in~ Reiche sollten sich ~ In the past, the ric~     2 pro  
      4 Der Kanton Aargau bra~ Höhere Steuereinnahm~ The canton of Aargau~     3 pro  
      5 Wird der Vermögensste~ Reiche ziehen weg, w~ If the millionaire t~     2 cont~
      6 Die Steuern im Kanton~ Steuern im Aargau so~ Taxes in the canton ~     3 cont~

---

    Code
      proposal_argument()
    Output
      [1] "Vermögenssteuer bringt Kantonshaushalt wieder ins Lot"

---

    Code
      proposal_main_motives()
    Output
      # A tibble: 6 x 3
         code de                                                         en           
        <int> <chr>                                                      <chr>        
      1     1 einer bestimmten Abstimmungsempfehlung folgen              to follow a ~
      2     2 den Kantonshaushalt sanieren                               to restructu~
      3     3 (Steuer-)Gerechtigkeit herstellen                          to establish~
      4     4 finanzschwache Personen und/oder den Mittelstand entlasten to relieve f~
      5     5 einen Ausgleich zwischen Arm und Reich schaffen            to create a ~
      6     6 die Reichen stärker zur Kasse bitten                       to charge th~

---

    `prcd` must be one of "proportional" or "majoritarian".

---

    `lvl` must be a string or have the same length as `values`.

---

    `lvl` must be a string or have the same length as `values`.

---

    `lvl` must be a string or have the same length as `values`.

---

    `lvl` must be a string or have the same length as `values`.

---

    `lvl` must be a string or have the same length as `values`.

---

    `lvl` must be a string or have the same length as `values`.

---

    `lvl` must be a string or have the same length as `values`.

---

    No political issues present in the supplemental "2018-09-23" FOKUS questionnaire data.

---

    Code
      response_options()
    Output
      [1] "niemanden (leer eingelegt oder nicht teilgenommen)"
      [2] "keine (leer eingelegt oder nicht teilgenommen)"    
      [3] "leer eingelegt/nicht abgestimmt"                   
      [4] "nicht teilgenommen oder leer eingelegt"            

# for certain fns, `canton` is really ignored (i.e. not evaluated) if `lvl = "federal"`

    Code
      proposal_arguments(ballot_date = "2021-11-28", lvl = "federal", canton = invalid_canton,
        proposal_nr = 2L)
    Output
      # A tibble: 4 x 5
        de.long                 de.short            en.long                   nr side 
        <chr>                   <chr>               <chr>                  <int> <chr>
      1 Indem das Parlament al~ Verletzung Gewalte~ By having the parliam~     1 pro  
      2 Bei der Wahl für ein d~ Zufallsbasierte Wa~ Leaving anything to c~     1 cont~
      3 Dass Bundesrichter-Kan~ Parteimitgliedscha~ The fact that, under ~     2 pro  
      4 Die heute gängige Part~ Parteizugehörigkei~ The common party affi~     2 cont~

---

    Code
      proposal_main_motives(ballot_date = "2021-11-28", lvl = "federal", canton = invalid_canton,
        proposal_nr = 2L)
    Output
      # A tibble: 6 x 3
         code de                                   en                                 
        <int> <chr>                                <chr>                              
      1     1 wollte in erster Linie einer bestim~ to follow a specific voting recomm~
      2     2 wollte ermöglichen, dass parteilose~ wanted to allow non-party candidat~
      3     3 glaube, das bisherige Wahlsystem ka~ believe the current electoral syst~
      4     4 bin der Überzeugung, die Verwendung~ believe the use of the lottery tic~
      5     5 wollte dafür sorgen, dass Bundesric~ wanted to ensure that federal judg~
      6     6 habe kein Vertrauen ins Parlament, ~ have no confidence in the Parliame~

---

    Code
      skill_question_response_options(ballot_date = "2021-11-28", lvl = "federal",
        canton = invalid_canton, proposal_nr = 2L, skill_question_nr = 1L)
    Output
      # A tibble: 4 x 3
        de                       en                               is_correct
        <chr>                    <chr>                            <lgl>     
      1 Der Bundesrat            The Federal Council              FALSE     
      2 Die Bundesversammlung    The Federal Assembly             TRUE      
      3 Das Bundesgericht selbst The Federal Supreme Court itself FALSE     
      4 Das Volk                 The people                       FALSE     

