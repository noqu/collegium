\version "2.18.2"
\language "deutsch"

\paper {
    top-margin = 10\mm
    bottom-margin = 10\mm
    left-margin = 10\mm
    right-margin = 10\mm
    ragged-last = ##t
}

\layout {
  ragged-last = ##f
}

\header{
  title = "Chanson de Matin"
  subtitle = ""
  composerShort = "Elgar"
  composer = "Edward Elgar (1857 - 1934)"
  tagline = "Op. 15 No. 2"
}

% Adapt this for automatic line-breaks
% mBreak = {}
mBreak = { \break }
#(set-global-staff-size 17)

% Useful snippets
pCresc = _\markup { \dynamic p \italic "cresc." }
mfDim = _\markup { \dynamic mf \italic "dim." }
pMoltoCresc = _\markup { \dynamic p \italic "molto cresc." }
stringendo = ^\markup { \italic "stringendo" }
allargando = _\markup { \italic "allargando" }
pocoRit = _\markup {\italic {"poco rit."} }
rit = _\markup {\italic {"rit."} }
solo = ^\markup { "Solo" }
piuTranquillo = ^\markup { \italic "Più tranquillo" }
accel = ^\markup { \bold { "accel." } }
tempoPrimo = ^\markup { \bold { "Tempo I" } }

% Adapted from http://lsr.di.unimi.it/LSR/Snippet?id=655
% Make title, subtitle, instrument appear on pages other than the first
#(define (part-not-first-page layout props arg)
   (if (not (= (chain-assoc-get 'page:page-number props -1)
               (ly:output-def-lookup layout 'first-page-number)))
       (interpret-markup layout props arg)
       empty-stencil))

\paper {
  oddHeaderMarkup = \markup
  \fill-line {
    " "
    \on-the-fly #part-not-first-page \fontsize #-1.0 \concat {
      \fromproperty #'header:composerShort
      "     -     "
      \fromproperty #'header:title
      "     -     "
      \fromproperty #'header:instrument
    }
    \on-the-fly #print-page-number-check-first \fromproperty #'page:page-number-string
  }
  evenHeaderMarkup = \markup
  \fill-line {
    \on-the-fly #print-page-number-check-first \fromproperty #'page:page-number-string
    \on-the-fly #part-not-first-page \fontsize #-1.0 \concat {
      \fromproperty #'header:composerShort
      "     -     "
      \fromproperty #'header:title
      "     -     "
      \fromproperty #'header:instrument
    }
    " "
  }
  % markup-system-spacing.basic-distance = #12
  % markup-system-spacing.minimum-distance = #12
  % markup-system-spacing.padding = #10
  
}

% ---------------------------------------------------------

clarinet_I_main = {
  \defaultTimeSignature
  \time 2/4
  \tempo "Allegretto"
  \key b \major
  \relative c''' {
    % cl1 page 1 line 1
    b8( \solo \mf f d es |
    c8 a g a) |
    b8( f d es |
    c8\dim a\! g a |
    \mark #1
    b2~) \p |
    b4 r4 |
    r2 |
    \mBreak

    % cl1 page 1 line 2
    r8 b'4( \p a8) |
    R2*4 |
    g2~( \pp |
    g2 |
    f2~ |
    f2 |
    es2~ \cresc |
    es2 \! |
    \mark #2
    d8) a'4( b8 \> |
    a2 |
    b8-!)\! \pocoRit r8 r4 |
    \mBreak

    % cl1 page 1 line 3
    es,2( \mfDim |
    f8) \accel r8 d'4(~ \pCresc |
    d8 c b c16 d) |
    c8( \tempoPrimo \f \> b g4~) |
    g8 \pp r8 r4 |
    R2 |
    d'4-. \p r4 |
    \bar "||"
    \mark #3
    f,2 \mf( |
    e4) r4 |
    \mBreak

    % cl1 page 1 line 4
    d8( \< e g b |
    d8) \! r8 r4 |
    d,8( \f \< e g16 b d g) \! |
    d'4~( \f \> d8. d,16) \! |
    d8 \dim( cis4 \! h8 |
    d8 \> cis h a) \! |
    R2 |
    \mBreak

    % cl1 page 2 line 1
    r8 a( \mf e f) |
    d8( \< e g b? \! |
    d4 \> d,) \! |
    R2 |
    r8 d'8( \< a b) \! |
    g8( a c es |
    g4) r4 |
    \mark #4
    b,2-^ \f \accel |
    a2-^ |
    \mBreak
    
    % cl1 page 2 line 2
    as2-^ |
    g2-^ |
    ges2-^ |
    ges2-^ |
    f2-^( \allargando |
    e4 des |
    \mark #5
    d8) \tempoPrimo f4--~ \f f8-. |
    r8 b4--~ b8-. |
    r8 es4 \> es8 |
    \mBreak
    
    % cl1 page 2 line 3
    R2 |
    f,2( \p g-> \dim |
    f8) \! r8 r4 |
    b8( \p \> a f4 |
    g8) \! r8 r4 |
    R2*5 |
    \mark #6 |
    r8 a4 ( \p \< b8) \> |
    a2( \! \< |
    b4) \! \pocoRit r4 |
    \mBreak
    
    % cl1 page 2 line 4
    es,2-^( \mfDim |
    f8) r8 d'4(~ \p \accel |
    d8 \cresc c b c16 d |
    c8 \tempoPrimo \f \> b g4~ |
    g8) \pp r8 r4 |
    \mark #7
    r8 \piuTranquillo g8( \pp \< a b) |
    d4. \! d8 |
    \mBreak
    
    % cl1 page 2 line 5
    d4( \> c~ |
    c4 \! b) |
    R2*2 |
    c2( \cresc |
    b2) |
    d4( \< c8 a) |
    b'4.( \f b,8) |
    b4->( a->) |
    as4.->( \> g8) |
    \mark #8
    g2(~ \<
    \mBreak
    
    % cl1 page 2 line 6
    g4 \> c,) |
    R2*4 \! |
    f4( \p e |
    f4 e |
    f4 e~ |
    e2) |
    R2 \fermataMarkup |
    \mark #9
    d2~( \pMoltoCresc \stringendo |
    d4 es? |
    e f |
    g b \sf |
    \mBreak

    % cl1 page 2 line 7
    a8-!) \f \rit r8 r4 |
    f4 r4 |
    R2*2 |
    b8( \p f d es |
    c8 \dim a g a |
    b4) \pp r4 |
    f''-. r4 |
    b,4-. r4 \fermata |
    \bar "|."
    \mBreak
  }
}

clarinet_II_main = {
  \defaultTimeSignature
  \time 2/4
  \tempo "Allegretto"
  \key b \major
  \relative c'' {

    % cl2 page 1 line 1
    b2~\> |
    b8(\! a es4 |
    d8) r8 r4 |
    r4 es( |
    d4) r4 |
    r2 |
    r2 |
    \mBreak

    % cl2 page 1 line 2
    r8 es4~ es8 |
    R2*4 |
    b2( |
    c2~ |
    c2 |
    b2~ |
    b2 |
    a2~ |
    a8) fis'4( g8 |
    fis2 |
    d8-!) r8 r4 |
    \mBreak

    % cl2 page 1 line 3
    g,2( |
    b8) r8 r4 |
    R2 |
    des2 |
    R2*2 |
    f4-. r4 |
    a,2~ |
    a4 r4 |
    \mBreak

    % cl2 page 1 line 4
    d8( e g b |
    d8) r8 r4 |
    d,8( e g d16 g) |
    d'2 |
    R2*3 |
    \mBreak

    % cl2 page 2 line 1
    r8 a( e f) |
    d8( e g b? |
    d4 d,) |
    R2 |
    r8 d'8( a b) |
    g8( a c, es |
    g4) r4 |
    des2-^ |
    c2-^ |
    \mBreak
    
    % cl2 page 2 line 2
    h2-^ |
    b2-^ |
    a?2-^ |
    as2-^ |
    g2-^(  |
    ges2 |
    f8) b4--~ b8-. |
    r8 f'4--~ f8-. |
    r8 g4 g8 |
    \mBreak
    
    % cl2 page 2 line 3
    r8 es4 es8 |
    d2~ |
    d2~ |
    d8 r8 r4 |
    R2*7 |
    r8 fis4( g8) |
    fis2( |
    d4) r4 |
    \mBreak
    
    % cl2 page 2 line 4
    g,2( |
    b8) r8 r4 |
    R2 |
    des2 |
    R2 |
    r8 g8( a b) |
    d4. d8 |
    \mBreak
    
    % cl2 page 2 line 5
    d4( c~ |
    c4 b) |
    R2*2 |
    g2( |
    es4 d) |
    b'4( a8 f) |
    b4.( b,8) |
    b4->( a->) |
    as4.->( g8) |
    g2(~
    \mBreak
    
    % cl2 page 2 line 6
    g4 c) |
    R2*8 |
    R2 \fermataMarkup
    b2( |
    h4 c |
    cis d |
    es? des |
    \mBreak

    % cl2 page 2 line 7
    c8-!) r8 r4 |
    es4 r4 |
    b'2~( |
    b8 a es4 |
    d4) r4 |
    R2*2 |
    d'4-. r4 |
    b,4-. r4 \fermata |
    \mBreak
  }
}

\bookpart {
  \header{
    instrument = "Klarinette I und II in A"
  }
  \score {
    \new GrandStaff <<
      \accidentalStyle Score.modern-cautionary
      \compressFullBarRests
      \new Staff {
        \transpose a a \clarinet_I_main
      }
      \new Staff {
        \transpose a a \clarinet_II_main
      }
    >>
  }
}
