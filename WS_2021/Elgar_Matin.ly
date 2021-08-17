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
  title = "Chanson de Matin"
  subtitle = ""
  composer = "Edward Elgar (1857 - 1934)"
  tagline = "Op. 15 No. 2"
}

% Adapt this for automatic line-breaks
% mBreak = {}
mBreak = { \break }
#(set-global-staff-size 17)

% Useful snippets
pCresc = \markup { \dynamic p \italic \bold "cresc." }
mfDim = _\markup { \dynamic mf \italic \bold "dim." }
pocoRit = _\markup {\italic {"poco rit."} }
solo = ^\markup { "Solo" }
accel = ^\markup { \bold { "accel." } }
tempoPrimo = ^\markup { \bold { "Tempo I" } }


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
    f8) \accel r8 d'4(~ |
    d8 c b c16 d) |
    c8( \tempoPrimo \f \> b g4) |
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
  }
}

\bookpart {
  \header{
    instrument = "Klarinette I und II in A"
  }
  \score {
    \new GrandStaff <<
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
