#include <iostream>

//! LABS
int max1(40);
int min1(20);

//! REGISTRADORES USADOS
int s0(0);
int s1(0);
int s2(0);
int t0(0);
int t1(0);
int t2(0);
int t3(0);

//!LABS
int exit(void){                         // EXIT
    std::cout << s1 << std::endl;       // syscall $v0 = 10
    return 10;
}

void dentro(void){                      // DENTRO
    s1 = 1;                         // li $s1, 1
    exit();                         // j EXIT
}

void fora(void){                // FORA
    s1 = 0;                      // li $s1, 0
    exit();                     // j EXIT
}

int main (void){
    std::cout << std::endl;     // syscal $v0 = 5
    s0 = max1;                   // lw $s0, max1
    s2 = min1;                   // lw $s2, min1
    s1 = 0;                      // li $s1, 0
    t1 = 1;                      // li $t1, 1
    if(t0<s2){                  // slt $t2, $t0, $s2
        t2 = 1;
    } else {
        t2 = 0;
    }
    if(t2==t1){                 // beq $t2, $t1, FORA
        fora();
    } else {
        if(s0<t0){              // slt $t3, $s0, $t0
            t2 = 1;
        } else {
            t2 = 0;
        }
        if(t3==t1){             // beq $t3, $t1, FORA
            fora();
        }
    }
}
