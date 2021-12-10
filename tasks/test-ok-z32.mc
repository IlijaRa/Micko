//OPIS: inkrement na vise mesta
//RETURN: 190

int y;

int f(int a) {
    int b;
    b = a++ + 13;
    a = b++ + 7;
    return a + b;
}


int main() {
    int x;
    int z;
    x = f(0); // 34
    y = f(3); // 40
    z = x++ + y++ + 42; // 116
    return x + y + z; // 190
}

