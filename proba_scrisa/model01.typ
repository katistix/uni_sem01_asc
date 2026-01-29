#set text(font: "New Computer Modern", size: 11pt, lang: "ro")
#set page(paper: "a4", margin: (x: 2cm, y: 2cm))

#align(center)[
  #text(size: 16pt, weight: "bold")[Universitatea Babeș-Bolyai] \
  #text(size: 14pt, weight: "bold")[Facultatea de Matematică și Informatică] \
  #text(size: 12pt, style: "italic")[Arhitectura Sistemelor de Calcul (ASC)] \
  #text(size: 12pt, weight: "bold")[Model de Examen Scris — Varianta Generator]
]

#line(length: 100%, stroke: 0.5pt)

== Subiectul 1: Reprezentare și Aritmetică (Flags)

Se consideră următoarea secvență de instrucțiuni:
```asm
mov al, 64 | 4
mov bl, 0A0h >> 2
sub al, bl

```

1. Detaliați efectul fiecărei linii sursă, exprimând valorile în bazele 10 și 16, cu și fără semn.
2. Precizați valorile registrelor de stare (Flags): CF, ZF, SF, OF după execuția instrucțiunii `sub`. Justificați.

== Subiectul 2: Manipularea Stivei și Controlul Fluxului

Fie secvența:

```asm
mov ebp, esp
push eax
mov eax, [ss:ebp-4]
jmp eax

```

1. Scrieți o singură instrucțiune ASM care are același efect final asupra registrului `EIP` și al stivei.
2. Explicați mecanismul prin care adresa de salt este preluată din stivă în acest context.

== Subiectul 3: Structura Segmentului de Date

Determinați structura memoriei (hex dump) pentru următorul segment de date, considerând offset-ul inițial 0:

```asm
segment data
    a db 10, -10, 0FFh
    b dw a, $ - a, 1234h
    c dd b, 0ABCDEFh
    d resb 4
    e db 'ASC', 0

```

*Notă:* Dacă identificați erori de sintaxă sau de relocare, specificați-le și ignorați elementul respectiv în reprezentarea finală.

== Subiectul 4: Teoria Reprezentării Numerelor

1. Care este numărul MINIM de biți necesari pentru reprezentarea numerelor  și respectiv  în complement de 2? Justificați prin intervale de reprezentare.
2. Furnizați reprezentarea acestora în baza 2 și baza 16 pe numărul minim de biți determinat.

== Subiectul 5: Clasificarea Instrucțiunilor (Efect asupra Registrelor)

Realizați o clasificare a următoarelor instrucțiuni în categorii după criteriul „efectului identic asupra registrului EAX”:

1. `lea eax, [eax+4]`
2. `add eax, 4`
3. `mov eax, [eax+4]`
4. `sub eax, -4`
5. `mov eax, eax+4`
6. `lea eax, dword [eax+4]`

Explicați de ce anumite instrucțiuni pot genera erori de sintaxă.

== Subiectul 6: Optimizarea Codului (Single Instruction)

Scrieți o singură instrucțiune `lea` care să înlocuiască secvența de mai jos, menținând efectul asupra registrului `EBX`:

```asm
shl eax, 3
add ebx, 10
add ebx, eax

```

Justificați alegerea formei de adresare utilizate.

== Subiectul 7: Analiza Instrucțiunilor pentru Numere cu Semn

Prezentați și exemplificați prin scurte secvențe de cod (2-3 linii) următoarele categorii de instrucțiuni:

1. Instrucțiuni de conversie (extensie de semn).
2. Instrucțiuni de deplasare aritmetică (păstrarea bitului de semn).
3. Instrucțiuni de salt condiționat specifice numerelor cu semn.

== Subiectul 8: Expresii și Operanzi în Modul de Date

Fie următoarele directive de definire a datelor:

```asm
x dw 100h & 0FFh, 1 << 4
y dd x + 2, y - x
z db 256, -129, 'ab'

```

Identificați instrucțiunile care vor genera "Warning" sau "Error" din partea asamblorului (ex: depășire de dimensiune, operanzi ne-relocatabili) și explicați motivul tehnic.

== Subiectul 9: Întrebări Teoretice de Grile/Sinteză

1. Este posibilă setarea simultană a flag-urilor  și  printr-o instrucțiune aritmetică obișnuită (ex: `add`, `sub`)? Justificați.
2. Explicați diferența dintre `mov eax, label` și `lea eax, [label]` în arhitectura x86.
3. Ce se întâmplă cu stiva la execuția instrucțiunii `ret 4`? Detaliați pașii.

== Subiectul 10: Adresare și Sintaxă

Se dă fragmentul:

```asm
mov dword [ebx + esi*4 + 8], 100

```

1. Identificați componentele modului de adresare (bază, index, scală, deplasament).
2. Este corectă instrucțiunea `mov [ebx], [esi]`? Dacă nu, propuneți o alternativă de 2 instrucțiuni care să realizeze transferul de memorie.

#v(2cm)
#line(length: 100%, stroke: 0.5pt)
#align(right)[*Succes la examen!*]
