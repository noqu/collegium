%{
%}

\version "2.18.2"
\language "deutsch"

\paper {
    top-margin = 10\mm
    bottom-margin = 10\mm
    left-margin = 10\mm
    right-margin = 10\mm
    ragged-last = ##t
}
  
\header{
  title = "4 Carillon"
  subtitle = ""
  composer = "Georges Bizet (1838 - 1875)"
  tagline = ""
}

% Adapt this for automatic line-breaks
mBreak = {}
% mBreak = { \break }
% #(set-global-staff-size 15)

% Useful snippets
pDolce = _\markup { \dynamic p \italic \bold "dolce" }
pBienMarque = _\markup { \dynamic p \italic "bien marqué" }
pocoSf = _\markup { \italic {"poco "} \dynamic sf }
pesante = _\markup {\italic {"pesante"} }
sempreCrescendo = _\markup {\italic {"sempre crescendo"} }
pocoRit = ^\markup {\italic {"poco rit."} }
dimMolto = _\markup {\italic {"dim. molto"} }
crescendoMolto = _\markup {\italic {"crescendo molto"} }
diminuendo = _\markup {\italic {"diminuendo"} }
moltoRit = ^\markup {\italic {"molto rit."} }
pocoAnimato = ^\markup {\italic {"poco animato"} }
pocoAPocoPiuAnimato = ^\markup {\italic {"poco a poco più animato"} }
pocoAPocoCrescendoMolto = _\markup { \italic {"poco a poco crescendo molto"} }
lunga = _\markup {\italic {"lunga"} }
string = ^\markup {\italic {"string."} }
legato = _\markup {\italic {"legato"} }
espress = ^\markup {\italic {"espress."} }
solo = ^\markup { "Solo" }

unisono_I = {
  % cl 1 p1 line 1
  \barNumberCheck #1
  R2.*4 |
  g'2-^\ff c4-^
  \repeat unfold 5 { g2-^ c4-^ } |
  g4-^ h-^ a-^ |
  g4-^ g-^ fis-^ |
  \break
  
  % cl 1 p1 line 2
  \barNumberCheck #13
  \repeat unfold 6 { g2-^ c4-^ } |
  g4-^ h-^ a-^ |
  g4-^ g-^ fis-^ |
  \mark #1
  d'2-^\pp d4-^ |
  \break
  
  % cl 1 p1 line 3
  \barNumberCheck #22
  \repeat unfold 2 { d2-^ d4-^ } |
  d4-^ d4-^ d4-^ |
  d2-^\crescendoMolto d4-^ |
  \repeat unfold 2 { d2-^ d4-^ } |
  d4-^ d4-^ d4-^ |
  d2-^\ff d4-^ |
  \repeat unfold 2 { d2-^ d4-^ } |
  \break
  
  % cl 1 p1 line 4
  \barNumberCheck #32
  d2-^ d4-^
}

unisono_II = {
  % cl1 p2 line 4
  \repeat unfold 2 { d2-^ d4-^ }
  \repeat unfold 3 { d4-^ } 
  d2-^\cresc d4-^ |
  \repeat unfold 2 { d2-^ d4-^ }
  \repeat unfold 3 { d4-^ } 
  d2-^\ff d4-^ |
  \repeat unfold 2 { d2-^ d4-^ }
  \break
  
  % cl1 p2 line 5
  \barNumberCheck125
  d2-^ d4-^ 
}

flEtHautb = ^\markup { FL. et HAUTB. }
hautb = ^\markup { HAUTB. }
clar = ^\markup { CLAR. }

clarinet_I_Music = {
  \relative c' {
    \transposition a
    \key g \major
    \numericTimeSignature
    \time 3/4
    \tempo "Allegretto moderato"

    % cl 1 p1 line 1
    \unisono_I

    % cl 1 p1 line 4
    \barNumberCheck #33
    f,2-^\pp f4 |
    \repeat unfold 3 { f2-^ f4-^ } |
    f2-^\pocoSf f4\dimMolto |
    f2-^ e4 |
    d2-^\pp e4-^ |
    fis?4-^ g-^ c,-^ |
    \break
    
    % cl 1 p1 line 5
    \barNumberCheck #41
    h4 r4 r4 |
    R2.*3 |
    h'2-^\pocoAPocoCrescendoMolto a4-^
    \repeat unfold 3 { h2-^ a4-^ } |
    \mark #2
    g'2.\ff~ |
    g2.~ |
    \break
    
    % cl 1 p1 line 6
    \barNumberCheck #51
    g8 r8 g4-^\solo a-^ |
    h4-^ g-^ a-^ |
    g2.-^~ |
    g2.~ |
    g8 r8 g4-^ a-^ |
    h4-^ g-^ a-^ |
    a8-.-^\ff r8 r4 r4 |
    R2.*2 |
    R2.\fermataMarkup |
    \bar "||"
    \break

    % cl1 p2 line 1
    \barNumberCheck #61
    \tempo "Andantino"
    \numericTimeSignature
    \time 6/8
    \mark #3
    R2.*19 |
    \teeny
    <g h>8.\flEtHautb( <fis a>16 <e g>8 q4 <dis fis>8 |
    <c e>4) e8(\ottava #1 <e' g>8. <d fis>16 <c e >8 |
    <h d>4 <d fis>8 <c e>8. <h d>16 <a c>8\ottava #0 |
    <g h>4) q8( q8. <fis a>16 <e g>8 |
    d4 h8 <cis e>8. <h d>16 <ais cis>8) |
    \normalsize
    \mark #4
    r8\espress\clar_\markup { \tiny "(Clarinet 1 plays small notes only if there is no saxophone)" } \tiny d(\pBienMarque cis h fis d |
    cis4 cis 8 e8. d16 cis8 |
    fis8) d'( cis h fis d |
    \break
    
    % cl1 p2 line 2
    \barNumberCheck 88
    cis4 cis8 e8. d16 cis8 |
    fis8 d e) fis4.~\pocoAPocoCrescendoMolto |
    fis8 a( g fis4. |
    g4. f' |
    e8 e, fis? g fis e |
    c'4. h4 a8 |
    g8) a( h c d e |
    fis,8 g a h\diminuendo c d |
    e,8) fis\( g a h c |
    \break
    
    % cl1 p2 line 3
    \barNumberCheck #97
    h,8 cis e \afterGrace dis4.\trill { cis16( dis16 } |
    e4)\)\p r8 r4. |
    \normalsize
    R2.*7 |
    \bar "||"
    \mark #5
    \tempo "Primo tempo"
    \numericTimeSignature
    \time 3/4
    \teeny
    d''2\hautb \tuplet 3/2 { a8( d a) } |
    g2 d4 |
    e8( fis) g h a fis |
    d8( e) fis( e) d a |
    d'2 \tuplet 3/2 { a8( d a) } |
    g2 d4 |
    e8( fis) g h a fis |
    \break
    
    % cl1 p2 line 4
    \barNumberCheck #113
    d8( e) fis e d r |
    \normalsize
    d2-^\pp\clar d4-^ |
    \unisono_II

    % cl1 p2 line 5
    \barNumberCheck #126
    f,2-^\pp f4 |
    f2-^ f4-^ |
    f2-^\< f4-^
    f2-^\! f4\pocoSf |
    f2-^ e4\dimMolto |
    f2-^ e4 |
    d2-^\pp e4-^ |
    fis4-^ g-^ c,-^ |
    h4 r4 r4 |
    R2. |
    \break
    
    % cl 1 p2 line 6
    \barNumberCheck #136
    R2.*2 |
    h'2-^\pocoAPocoCrescendoMolto a4-^ |
    \repeat unfold 3 { h2-^ a4-^ } |
    d2.~\ff\sempreCrescendo |
    \repeat unfold 2 { d2.~ } |
    { d2. }
    d2.~\fff~ |
    d2.~ |
    d8 r8 r4 r4 |
    \bar "|."
    \barNumberCheck #149
  }
}

clarinet_II_Music = {
  \relative c' {
    \transposition a
    \key g \major
    \numericTimeSignature
    \time 3/4
    \tempo "Allegretto moderato"

    % cl 2 p1 line 1
    \unisono_I
    
    % cl 2 p1 line 4
    \barNumberCheck #33
    \tiny
    g,2-^\pp c4-^_\markup { \tiny "(Clarinet 2 plays small notes only if there is no saxophone - otherwise plays with clarinet 1)" } |
    \repeat unfold 5 { g2-^ c4-^ } |
    g2-^ g4 |
    fis4-^ e-^ d-^ |
    \break
    
    % cl 2 p1 line 5
    \barNumberCheck #41
    d2-^ d4-^\pocoAPocoCrescendoMolto |
    \repeat unfold 7 { d2-^ d4-^ } |
    \normalsize
    \mark #2
    d'2.\ff~ |
    d2.~ |
    \break
    
    % cl 2 p1 line 6
    \barNumberCheck #51
    d8 r8 d4-^\solo d-^ |
    d4-^ d-^ d-^ |
    dis2.-^~ |
    dis2.~ |
    dis8 r8 dis4-^ dis-^
    dis4-^ dis-^ dis-^ |
    dis8 -.-^\ff r8 r4 r4 |
    R2.*2 |
    R2.\fermataMarkup |
    \bar "||"
    \break
    
    % cl 2 p2 line 1-3
    \barNumberCheck #61
    \tempo "Andantino"
    \numericTimeSignature
    \time 6/8
    \mark #3
    R2.*19 |
    R2.*5 |
    \mark #4
    R2.*14 |
    R2.*7 |
    \bar "||"
    \mark #5
    \tempo "Primo tempo"
    \numericTimeSignature
    \time 3/4
    R2.*8 
    
    % cl 2 p2 line 4
    \barNumberCheck #114
    d2-^\pp d4-^ |
    \unisono_II
    
    % cl 2 p2 line 5
    \barNumberCheck #126
    \tiny
    g,2-^\pp c4-^_\markup { \tiny "(Clarinet 2 plays small notes only if there is no saxophone - otherwise plays with clarinet 1)" } |
    \repeat unfold 5 { g2-^ c4-^ } |
    g2-^ g4 |
    fis4-^ e-^ d-^ |
    \repeat unfold 2 { d2-^ d4-^ }
    \break
    
    % cl 2 p2 line 6
    d2-^ d4-^\pocoAPocoCrescendoMolto |
    \repeat unfold 5 { d2-^ d4-^ } |
    \normalsize
    h'2.~\ff\sempreCrescendo |
    \repeat unfold 2 { h2.~ } |
    { h2. }
    h2.~\fff~ |
    h2.~ |
    h8 r8 r4 r4 |
    \bar "|."
    \barNumberCheck #149
  }
}


\bookpart {
  \header{
    instrument = "Klarinette I/II in Bb"
  }
  \score {
    \new GrandStaff <<
      \new Staff {
        \compressFullBarRests
        % Make grace notes smaller and more fragile
        $(add-grace-property 'Voice 'NoteHead 'font-size '-5)
        $(add-grace-property 'Voice 'Slur 'height-limit '0.5)
        $(add-grace-property 'Voice 'Flag 'font-size '-5)
        $(add-grace-property 'Voice 'Stem 'length '8)
        $(add-grace-property 'Voice 'Beam 'beam-thickness '0.3)
        $(add-grace-property 'Voice 'Beam 'length-fraction '0.5)
        $(add-grace-property 'Voice 'Beam 'shorten '1)
        \set Score.markFormatter = #format-mark-box-alphabet
        \override DynamicLineSpanner.staff-padding = #3
        \accidentalStyle Score.modern-cautionary
        \new Voice {
          {
            \transpose b a
            \clarinet_I_Music
          }
        }
      }
      \new Staff {
        \compressFullBarRests
        % Make grace notes smaller and more fragile
        $(add-grace-property 'Voice 'NoteHead 'font-size '-5)
        $(add-grace-property 'Voice 'Slur 'height-limit '0.5)
        $(add-grace-property 'Voice 'Flag 'font-size '-5)
        $(add-grace-property 'Voice 'Stem 'length '8)
        $(add-grace-property 'Voice 'Beam 'beam-thickness '0.3)
        $(add-grace-property 'Voice 'Beam 'length-fraction '0.5)
        $(add-grace-property 'Voice 'Beam 'shorten '1)
        \set Score.markFormatter = #format-mark-box-alphabet
        \override DynamicLineSpanner.staff-padding = #3
        \accidentalStyle Score.modern-cautionary
        \new Voice {
          {
            \transpose b a
            \clarinet_II_Music
          }
        }
      }
    >>
  }
}
