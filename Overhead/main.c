#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <inttypes.h>
#include <gmp.h>


gmp_randstate_t rand_state;

void grand(const mpz_t range, mpz_t rand_num)
{
    if (mpz_cmp_ui(range, 0) > 0)
    {
        mpz_urandomm(rand_num, rand_state, range);
    }
    else
    {
        printf("Error: range must be greater than zero.\n");
    }
}

// original modular exponentiation without fault detections
void pow_nf(mpz_t base, mpz_t exponent, mpz_t modulus, mpz_t Phi, mpz_t result)
{
    mpz_set_ui(result, 1);
    mpz_t temp_x;
    mpz_t temp_y;
    mpz_init(temp_x);
    mpz_init(temp_y);
    mpz_mod(temp_x, base, modulus);
    mpz_mod(temp_y, exponent, Phi);

    while (mpz_cmp_ui(temp_y, 0) > 0)
    {
        if (mpz_odd_p(temp_y))
        {
            mpz_mul(result, result, temp_x);
            mpz_mod(result, result, modulus);
        }
        mpz_divexact_ui(temp_y, temp_y, 2);
        mpz_mul(temp_x, temp_x, temp_x);
        mpz_mod(temp_x, temp_x, modulus);
    }

    mpz_clear(temp_x);
    mpz_clear(temp_y);
}

void modular_pow(mpz_t base, mpz_t exponent, mpz_t modulus, mpz_t Phi, int l, mpz_t result, mpz_t partial_result, int *weight)
{
    int counter = 0;
    mpz_set_ui(result, 1);
    mpz_t temp_x;
    mpz_t temp_y;
    int hm = 0;
    mpz_init(temp_x);
    mpz_init(temp_y);
    mpz_mod(temp_x, base, modulus);
    mpz_mod(temp_y, exponent, Phi);

    while (mpz_cmp_ui(temp_y, 0) > 0)
    {
        if (mpz_odd_p(temp_y))
        {
            hm++;
            mpz_mul(result, result, temp_x);
            mpz_mod(result, result, modulus);
        }
        mpz_divexact_ui(temp_y, temp_y, 2);
        mpz_mul(temp_x, temp_x, temp_x);
        mpz_mod(temp_x, temp_x, modulus);

        counter++;
        if (counter == l)
        {
            mpz_set(partial_result, result);
        }

        if (counter < l)
        {
            mpz_set(partial_result, result);
        }
    }
    *weight = hm;

    mpz_clear(temp_x);
    mpz_clear(temp_y);
}

void part_modular_pow(mpz_t base, mpz_t exponent, mpz_t modulus, mpz_t Phi, int l, mpz_t partial_result, int *weight)
{
    int counter = 0;
    mpz_set_ui(partial_result, 1);
    mpz_t temp_x;
    mpz_t temp_y;
    int hm = 0;
    mpz_init(temp_x);
    mpz_init(temp_y);
    mpz_mod(temp_x, base, modulus);
    mpz_mod(temp_y, exponent, Phi);

    while (mpz_cmp_ui(temp_y, 0) > 0 && counter != l)
    {
        if (mpz_odd_p(temp_y))
        {
            hm++;
            mpz_mul(partial_result, partial_result, temp_x);
            mpz_mod(partial_result, partial_result, modulus);
        }

        mpz_divexact_ui(temp_y, temp_y, 2);
        mpz_mul(temp_x, temp_x, temp_x);
        mpz_mod(temp_x, temp_x, modulus);
        counter++;
    }

    while (mpz_cmp_ui(temp_y, 0) > 0)
    {
        if (mpz_odd_p(temp_y))
        {
            hm++;
        }
        mpz_divexact_ui(temp_y, temp_y, 2);
    }

    *weight = hm;
    mpz_clear(temp_x);
    mpz_clear(temp_y);
}

int main()
{
    gmp_randinit_default(rand_state);
    gmp_randseed_ui(rand_state, time(NULL));

    mpz_t x, x1, x2, y, y1, y2, N, Phi;
    mpz_t answer, result1, partial_result1, partial_result2;

    int size, weight1, weight2;

    int l = 128;
    int iteration = 1000;
    int not_detected = 0;
    int not_happened = 0;
    int detected = 0;

    // encoders
    mpz_t k1, k2, k3, k4;
    mpz_t range_encoder1, range_encoder2;

    mpz_t range_x; // range for x random creation
    mpz_t range_y; // range for y random creation

    mpz_t temp_mul;

    /**********************************/
    // initialize

    mpz_init(N);
    mpz_init(Phi);
    mpz_init(x);
    mpz_init(x1);
    mpz_init(x2);
    mpz_init(y);
    mpz_init(y1);
    mpz_init(y2);

    mpz_init(answer);
    mpz_init(result1);
    mpz_init(partial_result1);
    mpz_init(partial_result2);

    mpz_init(range_x);
    mpz_init(range_y);

    mpz_init(range_encoder1);
    mpz_init(range_encoder2);

    mpz_init(temp_mul);

    mpz_init(k1);
    mpz_init(k2);
    mpz_init(k3);
    mpz_init(k4);

    const char *N_str = "32317006071311007300714876688669951960444102669715484032130345427524655138867890893197201411522913463688717960921898019494119559150490921095088152386448283120630877367300996091750197750389652106796057638384067568276792218642619756161838094338476170470581645852036305042887575891541065808607552399123930385521914333389668342420684974786564569494856176035326322058077805659331026192708460314150258592864177116725943603718461857357598351152301645904403697613233287231227125684710820209725157101726931323469678542580656697935045997268352998638215525166389647960126939249806625440700685819469589938384356951833568218188663";
    const char *Phi_str = "32317006071311007300714876688669951960444102669715484032130345427524655138867890893197201411522913463688717960921898019494119559150490921095088152386448283120630877367300996091750197750389652106796057638384067568276792218642619756161838094338476170470581645852036305042887575891541065808607552399123930385521914333389668342420684974786564569494856176035326322058077805659331026192708460314150258592864177116725943603718461857357598351152301645904403697613233287231227125684710820209725157101726931323469678542580656697935045997268352998638215525166389647960126939249806625440700685819469589938384356951833568218188662";

    mpz_set_str(N, N_str, 10);
    mpz_set_str(Phi, Phi_str, 10);

    mpz_setbit(range_encoder1, 50); // size of encoder for x. min = 0 means no encoder
    mpz_setbit(range_encoder2, 50); // size of encoder for y. min = 0 means no encoder

    mpz_setbit(range_x, 2048); // size of x in bits
    mpz_setbit(range_y, 2048); // size of y in bits

    struct timespec start_time, end_time;
    double elapsed_time;

    /**************************************/
    /***** implementation starts here *****/
    /**************************************/

    PAPI_hl_region_begin("simple");
    for (int i = 0; i < iteration; i++)
    {
        grand(range_x, x);
        grand(range_y, y);
        pow_nf(x, y, N, Phi, answer);
    }
    PAPI_hl_region_end("simple");

    PAPI_hl_region_begin("with_error");
    // Error detection here
    for (int i = 0; i < iteration; i++)
    {
        grand(range_x, x);
        grand(range_y, y);

        grand(range_encoder1, k1);
        grand(range_encoder2, k2);
        grand(range_encoder1, k3);
        grand(range_encoder2, k4);

        // encode x1
        mpz_mul(temp_mul, k1, N);
        mpz_add(x1, x, temp_mul);

        // encode y1
        mpz_mul(temp_mul, k2, Phi);
        mpz_add(y1, y, temp_mul);

        // compute Q1 and Q1_partial
        modular_pow(x1, y1, N, Phi, l, result1, partial_result1, &weight1);

        // encode x2
        mpz_mul(temp_mul, k3, N);
        mpz_add(x2, x, temp_mul);

        // encode y2
        mpz_mul(temp_mul, k4, Phi);
        mpz_add(y2, y, temp_mul);

        // compute Q2_partial
        part_modular_pow(x2, y2, N, Phi, l, partial_result2, &weight2);

        if (mpz_cmp(answer, result1) == 0)
        {
            not_happened++;
        }

        else if (mpz_cmp(partial_result1, partial_result2) != 0 || weight1 != weight2)
        {
            detected++;
        }

        else if (mpz_cmp(partial_result1, partial_result2) == 0 && weight1 == weight2 && mpz_cmp(result1, answer) != 0)
        {
            not_detected++;
        }
    }
    PAPI_hl_region_end("with_error");

    mpz_clear(N);
    mpz_clear(Phi);
    mpz_clear(x);
    mpz_clear(x1);
    mpz_clear(x2);
    mpz_clear(y);
    mpz_clear(y1);
    mpz_clear(y2);
    mpz_clear(answer);
    mpz_clear(result1);
    mpz_clear(partial_result1);
    mpz_clear(partial_result2);
    mpz_clear(range_encoder1);
    mpz_clear(range_encoder2);
    mpz_clear(range_x);
    mpz_clear(range_y);
    mpz_clear(k1);
    mpz_clear(k2);
    mpz_clear(k3);
    mpz_clear(k4);
    mpz_clear(temp_mul);
    gmp_randclear(rand_state);

    return 0;
}

// to compile use: clang-11  -Wall  main.c  lib/libpapi.a  -lm -lgmp