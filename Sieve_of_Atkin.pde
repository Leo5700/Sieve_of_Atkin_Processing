// **

IntList SieveOfAtkin(int lmt) {
  // prime number generator on the Sieve_of_Atkin algorithm https://en.wikipedia.org/wiki/Sieve_of_Atkin (решето Аткина)
  // based on https://www.tutorialspoint.com/cplusplus-program-to-implement-sieve-of-atkin-to-generate-prime-numbers-between-given-range
  IntList cout = new IntList();  
  if (lmt > 2)
    cout.append(2);
  if (lmt > 3)
    cout.append(3);
  boolean[] sieve = new boolean[lmt]; 
  for (int i = 0; i < lmt; i++)
    sieve[i] = false;
  for (int a = 1; a * a < lmt; a++) {
    for (int b = 1; b * b < lmt; b++) {
      // Main part of Sieve of Atkin
      int n = (4 * a* a) + (b * b);
      if (n <= lmt && (n % 12 == 1 || n % 12 == 5))
        sieve[n] ^= true;
      n = (3 * a * a) + (b * b);
      if (n <= lmt && n % 12 == 7)
        sieve[n] ^= true;
      n = (3 * a * a) - (b * b);
      if (a > b && n <= lmt && n % 12 == 11)
        sieve[n] ^= true;
    }
  }
  for (int r = 5; r * r < lmt; r++) {
    if (sieve[r]) {
      for (int i = r * r; i < lmt; i += r * r)
        sieve[i] = false;
    }
  }
  for (int x = 5; x < lmt; x++)
    if (sieve[x])
      cout.append(x);
  return cout;
}


void setup() {
  println(SieveOfAtkin(1000)); //
  noLoop();
}


void draw() {
  exit();
}
