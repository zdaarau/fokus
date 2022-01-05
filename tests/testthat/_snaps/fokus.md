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

# `canton` is really irrelevant if `lvl = "federal"` for certain fns

    Code
      proposal_type(lvl = "federal", canton = invalid_canton)
    Output
      [1] "citizens' initiative"

---

    Code
      proposal_name(lvl = "federal", canton = invalid_canton)
    Output
      [1] "Velo-Initiative"

---

    Code
      proposal_name_gender(lvl = "federal", canton = invalid_canton)
    Output
      [1] "feminine"

---

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
      proposal_argument(ballot_date = "2021-11-28", lvl = "federal", canton = invalid_canton,
        proposal_nr = 2L, argument_nr = 1L, side = "pro")
    Output
      [1] "Verletzung Gewaltenteilung"

---

    Code
      n_proposal_arguments(lvl = "federal", canton = invalid_canton)
    Output
      [1] 0

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
      n_proposal_main_motives(lvl = "federal", canton = invalid_canton)
    Output
      [1] 0

---

    Code
      election_name(ballot_date = "2019-10-20", lvl = "federal", canton = invalid_canton,
        prcd = "proportional")
    Output
      [1] "Nationalratswahl"

---

    Code
      n_skill_questions(lvl = "federal", canton = invalid_canton)
    Output
      [1] 0

---

    Code
      skill_question(ballot_date = "2021-11-28", lvl = "federal", canton = invalid_canton,
        proposal_nr = 2L, skill_question_nr = 1L)
    Output
      [1] "Wer hat bisher die Mitglieder des Bundesgerichts gewählt?"

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

---

    Code
      skill_question_answer_nr(ballot_date = "2021-11-28", lvl = "federal", canton = invalid_canton,
        proposal_nr = 2L, skill_question_nr = 1L)
    Output
      [1] 2

