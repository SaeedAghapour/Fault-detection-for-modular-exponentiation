#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <gmp.h>


int calculateBitSize(const mpz_t x) 
{
    int bitSize = 0;
    mpz_t temp;
    mpz_init(temp);
    mpz_set(temp, x);

    while (mpz_cmp_ui(temp, 0) > 0) 
    {
        mpz_tdiv_q_2exp(temp, temp, 1);
        bitSize++;
    }
    mpz_clear(temp);
    return bitSize;
}


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

void modular_pow(mpz_t base, mpz_t exponent, mpz_t modulus, mpz_t Phi, int l, mpz_t result, mpz_t partial_result, int* weight)
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
            hm ++;
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

void part_modular_pow(mpz_t base, mpz_t exponent, mpz_t modulus, mpz_t Phi, int l, mpz_t partial_result, int* weight)
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
            hm ++;
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
            hm ++;
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
    
    mpz_t x, x1, x2, x1f, x2f, y, y1, y2, y1f, y2f, N, Phi;
    mpz_t answer, result1, partial_result1, partial_result2, partial_answer;
    int size, weight_answer, weight1, weight2;
    unsigned long start_bit, bit_position;

    //encoders
    mpz_t k1, k2, k3, k4, z, two;
    mpz_t range_encoder1, range_encoder2;

    //simulation values
    mpz_t range_x, range_y, range_flip, temp_mul, mask;
 
    int model;
    // fault model: 1 => random bit flipping
    // fault model: 2 => burst bit flipping
    // fault model: 3 => total random

    int l = 256;
    model = 3;

    int n1 = 0; // number of bit flipping for x1
    int n2 = 0; // number of bit flipping for y1
    int n3 = 0; // number of bit flipping for x2
    int n4 = 0; // number of bit flipping for y2

    int iteration = 10000;
    
    int detected = 0;
    int not_detected = 0;
    int not_happened = 0;
    float rate;

    /**********************************/
    // initialize

    mpz_init(N);
    mpz_init(Phi);
    mpz_init(x);
    mpz_init(x1);
    mpz_init(x1f);
    mpz_init(x2);
    mpz_init(x2f);
    mpz_init(two);
    mpz_init(y);
    mpz_init(y1);
    mpz_init(y1f);
    mpz_init(y2);
    mpz_init(y2f);
    mpz_init(answer);
    mpz_init(result1);
    mpz_init(partial_result1);
    mpz_init(partial_result2);
    mpz_init(partial_answer);
    mpz_init(range_x);
    mpz_init(range_y);
    mpz_init(range_encoder1);
    mpz_init(range_encoder2);
    mpz_init(range_flip);
    mpz_init(temp_mul);
    mpz_init(z);
    mpz_init(k1);
    mpz_init(k2);
    mpz_init(k3);
    mpz_init(k4);

    const char *N_str = "32317006071311007300714876688669951960444102669715484032130345427524655138867890893197201411522913463688717960921898019494119559150490921095088152386448283120630877367300996091750197750389652106796057638384067568276792218642619756161838094338476170470581645852036305042887575891541065808607552399123930385521914333389668342420684974786564569494856176035326322058077805659331026192708460314150258592864177116725943603718461857357598351152301645904403697613233287231227125684710820209725157101726931323469678542580656697935045997268352998638215525166389647960126939249806625440700685819469589938384356951833568218188663";
    const char *Phi_str = "32317006071311007300714876688669951960444102669715484032130345427524655138867890893197201411522913463688717960921898019494119559150490921095088152386448283120630877367300996091750197750389652106796057638384067568276792218642619756161838094338476170470581645852036305042887575891541065808607552399123930385521914333389668342420684974786564569494856176035326322058077805659331026192708460314150258592864177116725943603718461857357598351152301645904403697613233287231227125684710820209725157101726931323469678542580656697935045997268352998638215525166389647960126939249806625440700685819469589938384356951833568218188662";
    
    mpz_set_str(N, N_str, 10);
    mpz_set_str(Phi, Phi_str, 10);
    mpz_init_set_ui(two, 2);

    mpz_setbit(range_encoder1, 50);   //size of encoder for x. min = 0 means no encoder
    mpz_setbit(range_encoder2, 50);   //size of encoder for y. min = 0 means no encoder

    mpz_setbit(range_x, 2048);  //size of x in bits
    mpz_setbit(range_y, 2048);  //size of y in bits
    
    /**********************************/
    /***** simulation starts here *****/
    /**********************************/

    for(int i = 0; i < iteration; i++)
    {
        grand(range_encoder1, k1);
        grand(range_encoder2, k2);
        grand(range_encoder1, k3);
        grand(range_encoder2, k4);
        grand(range_x, x);
        grand(range_y, y);
        modular_pow(x, y, N, Phi, l, answer, partial_answer, &weight_answer);
        
        /********* Encode @ t1 *********/
        // x1 = x + k1 * N,  y1 = y + k2 * Phi;

        mpz_mul(temp_mul, k1, N);
        mpz_add(x1, x, temp_mul);

        mpz_mul(temp_mul, k2, Phi);
        mpz_add(y1, y, temp_mul);  

        /********* Encode @ t2 *********/
        // x2 = x + k3 * N,  y2 = y + k4 * Phi

        mpz_mul(temp_mul, k3, N);
        mpz_add(x2, x, temp_mul);  

        mpz_mul(temp_mul, k4, Phi);
        mpz_add(y2, y, temp_mul);

        /******************************/
        /****** fault injections ******/
        /******************************/
       
        if (model == 1)  // fault model: random bit flipping
        {
            // x1
            mpz_set(x1f, x1);
            size = calculateBitSize(x1);
            mpz_init_set_ui(range_flip, size);

            for (int i1 = 0; i1 < n1; i1++)
            {
                grand(range_flip, z);
                mpz_pow_ui(temp_mul, two, mpz_get_ui(z)); 
                mpz_xor(x1f, x1f, temp_mul);
            }

            // y1
            mpz_set(y1f, y1);
            size = calculateBitSize(y1);
            mpz_init_set_ui(range_flip, size);

            for (int i2 = 0; i2 < n2; i2++)
            {
                grand(range_flip, z);
                mpz_pow_ui(temp_mul, two, mpz_get_ui(z)); 
                mpz_xor(y1f, y1f, temp_mul);
            }

            // x2
            mpz_set(x2f, x2);
            size = calculateBitSize(x2);
            mpz_init_set_ui(range_flip, size);

            for (int i3 = 0; i3 < n3; i3++)
            {
                grand(range_flip, z);
                mpz_pow_ui(temp_mul, two, mpz_get_ui(z)); 
                mpz_xor(x2f, x2f, temp_mul);
            }

            // y2
            mpz_set(y2f, y2);
            size = calculateBitSize(y2);
            mpz_init_set_ui(range_flip, size);

            for (int i4 = 0; i4 < n4; i4++)
            {
                grand(range_flip, z);
                mpz_pow_ui(temp_mul, two, mpz_get_ui(z)); 
                mpz_xor(y2f, y2f, temp_mul);
            }

        }

        else if (model == 2)  // fault model: burst bit flipping
        {
            // x1
            mpz_set(x1f, x1);
            size = calculateBitSize(x1);
            mpz_init_set_ui(range_flip, size);
            grand(range_flip, z);
            start_bit = mpz_get_ui(z) % size;

            for (int i1 = 0; i1 < n1; i1++)
            {
                bit_position = (start_bit + i1) % size;
                mpz_init_set_ui(mask, 1);
                mpz_mul_2exp(mask, mask, bit_position);
                mpz_xor(x1f, x1f, mask);
                
                mpz_clear(mask);
            }

            // y1
            mpz_set(y1f, y1);
            size = calculateBitSize(y1);
            mpz_init_set_ui(range_flip, size);
            grand(range_flip, z);
            start_bit = mpz_get_ui(z) % size;

            for (int i2 = 0; i2 < n2; i2++)
            {
                bit_position = (start_bit + i2) % size;
                mpz_init_set_ui(mask, 1);
                mpz_mul_2exp(mask, mask, bit_position);
                mpz_xor(y1f, y1f, mask);
                
                mpz_clear(mask);
            }

            // x2
            mpz_set(x2f, x2);
            size = calculateBitSize(x2);
            mpz_init_set_ui(range_flip, size);
            grand(range_flip, z);
            start_bit = mpz_get_ui(z) % size;

            for (int i3 = 0; i3 < n3; i3++)
            {
                bit_position = (start_bit + i3) % size;
                mpz_init_set_ui(mask, 1);
                mpz_mul_2exp(mask, mask, bit_position);
                mpz_xor(x2f, x2f, mask);
                
                mpz_clear(mask);
            }

            // y2

            mpz_set(y2f, y2);
            size = calculateBitSize(y2);
            mpz_init_set_ui(range_flip, size);
            grand(range_flip, z);
            start_bit = mpz_get_ui(z) % size;

            for (int i4 = 0; i4 < n4; i4++)
            {
                bit_position = (start_bit + i4) % size;
                mpz_init_set_ui(mask, 1);
                mpz_mul_2exp(mask, mask, bit_position);
                mpz_xor(y2f, y2f, mask);
                
                mpz_clear(mask);
            }

        }

        else if (model == 3)
        {
            // x1
            size = calculateBitSize(x1);
            mpz_setbit(range_flip, size);
            grand(range_flip, x1f);

            // y1
            size = calculateBitSize(y1);
            mpz_setbit(range_flip, size);
            grand(range_flip, y1f);

            // x2
            size = calculateBitSize(x2);
            mpz_setbit(range_flip, size);
            grand(range_flip, x2f);

            // y2
            size = calculateBitSize(y2);
            mpz_setbit(range_flip, size);
            grand(range_flip, y2f);
        }

        // @ t_1: compute result1, result1_partial, and HM1

        modular_pow(x1f, y1f, N, Phi, l, result1, partial_result1, &weight1);

        // @ t_2: compute result2_partial and HM2

        part_modular_pow(x2f, y2f, N, Phi, l, partial_result2, &weight2);


        /****** fault detections ******/

        if (mpz_cmp(answer, result1) == 0)
        {
            // no fault happened
            not_happened ++;
        }

        else if (mpz_cmp(partial_result1, partial_result2) != 0 || weight1 != weight2)
        {
            // fault happened and got detected
            detected ++;
        }

        else if (mpz_cmp(partial_result1, partial_result2) == 0 && weight1 == weight2 && mpz_cmp(result1, answer) != 0)
        {
            // fault happened and not detected
            not_detected ++;
        }

    }

    rate =  100 - (100 * (not_detected) / iteration);
    printf("number of undetected faults: %d\n", not_detected);
    printf("number of no faulty result: %d\n", not_happened);
    printf("number of detected faults:   %d\n", detected);
    printf("fault rate is %f\n", rate);
 
 
    /****************************************/
    /****** clear constants and faults ******/
    /****************************************/

    mpz_clear(N);
    mpz_clear(Phi);
    mpz_clear(x);
    mpz_clear(x1);
    mpz_clear(x1f);
    mpz_clear(x2);
    mpz_clear(x2f);
    mpz_clear(y);
    mpz_clear(y1);
    mpz_clear(y1f);
    mpz_clear(y2);
    mpz_clear(y2f);
    mpz_clear(partial_answer);
    mpz_clear(answer);
    mpz_clear(result1);
    mpz_clear(partial_result1);
    mpz_clear(partial_result2);
    mpz_clear(range_encoder1);
    mpz_clear(range_encoder2);
    mpz_clear(range_x);
    mpz_clear(range_y);
    mpz_clear(range_flip);
    mpz_clear(z);
    mpz_clear(k1);
    mpz_clear(k2);
    mpz_clear(k3);
    mpz_clear(k4);
    mpz_clear(temp_mul);
    mpz_clear(two);

    // Clear the random state when done
    gmp_randclear(rand_state);

    return 0;
}

// to compile: gcc main.c -o main -lgmp