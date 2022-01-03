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

    No "cantonal" elections for canton "aargau" present in the supplemental "2018-09-23" FOKUS questionnaire data.

---

    No "cantonal" elections for canton "aargau" present in the supplemental "2018-09-23" FOKUS questionnaire data.

---

    No "cantonal" elections for canton "aargau" present in the supplemental "2018-09-23" FOKUS questionnaire data.

---

    No "cantonal" elections for canton "aargau" present in the supplemental "2018-09-23" FOKUS questionnaire data.

---

    No "cantonal" elections for canton "aargau" present in the supplemental "2018-09-23" FOKUS questionnaire data.

---

    No "cantonal" elections for canton "aargau" present in the supplemental "2018-09-23" FOKUS questionnaire data.

---

    No "cantonal" elections for canton "aargau" present in the supplemental "2018-09-23" FOKUS questionnaire data.

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

