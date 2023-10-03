import 'package:flutter/material.dart';





class Gift2 extends StatefulWidget {
  const Gift2({Key? key}) : super(key: key);

  @override
  State<Gift2> createState() => _Gift2State();
}

class _Gift2State extends State<Gift2> {

@override
  Widget build(BuildContext context) {

    double baseWidth = 380;
    double fem = MediaQuery.of(context).size.width / baseWidth;

    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Container(
          // cadeaux919 (200:274)
          width: double.infinity,
          decoration: BoxDecoration (
            color: Colors.white,
            borderRadius: BorderRadius.circular(20*fem),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                // autogroupkletrgF (KMTkeMWcjV1NYDuhVmKLET)
                width: double.infinity,
                height: 663*fem,
                child: Stack(
                  children: [
                    Positioned(
                      // pointsetcadeauxBiX (200:277)
                      left: 23*fem,
                      top: 82*fem,
                      child: Align(
                        child: SizedBox(
                          width: 120 * fem,
                          height: 15 * fem,
                          child:const  Text(
                            'Points et Cadeaux',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ),

                      ),
                    ),
                    Positioned(
                      // autogroupwplfrJs (KMTjXyCENmSgu6CztAWpLf)
                      left: 24*fem,
                      top: 110*fem,
                      child: SizedBox(
                        width: 330*fem,
                        height: 30*fem,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // vousavezZj5 (200:278)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 131*fem, 1*fem),
                              child: const Text(
                                'Vous avez',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.blue,
                                  fontFamily: 'Inter',

                                ),

                              ),
                            ),
                            const Text(
                              // pointsriB (200:281)
                              '1000 Points',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.blue,


                              ),

                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      // line10nrj (200:279)
                      left: 23*fem,
                      top: 100*fem,
                      child: Align(
                        child: SizedBox(
                          width: 332*fem,
                          height: 1*fem,
                          child: Container(
                            decoration: const BoxDecoration (
                              color: Color(0xff848484),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // autogroupx7qz66j (KMTjhDRpshjTkv8iMZX7qZ)
                      left: 40*fem,
                      top: 170*fem,
                      child: Container(
                        width: 307.17*fem,
                        height: 54*fem,
                        decoration: BoxDecoration (
                          color: const Color(0xff273085),
                          borderRadius: BorderRadius.circular(50*fem),
                        ),
                        child: const Center(
                          child: Text(
                            'Recharge téléphonique 1 DT...1000 Points',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.white,


                            ),

                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // autogroupr3z7jQb (KMTjoTkRA7sfFt2gbNR3z7)
                      left: 40*fem,
                      top: 241*fem,
                      child: Container(
                        width: 307.17*fem,
                        height: 54*fem,
                        decoration: BoxDecoration (
                          color: const Color(0xff273085),
                          borderRadius: BorderRadius.circular(50*fem),
                        ),
                        child: const Center(
                          child: Text(
                            'Recharge téléphonique 1 DT...5000 Points',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.white,

                            ),

                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // autogroupsphhypj (KMTjunuCizdYMFsUkisPHH)
                      left: 40*fem,
                      top: 312*fem,
                      child: Container(
                        width: 307.17*fem,
                        height: 54*fem,
                        decoration: BoxDecoration (
                          color: const Color(0xff273085),
                          borderRadius: BorderRadius.circular(50*fem),
                        ),
                        child: const Center(
                          child: Text(
                            'Recharge téléphonique 1 DT...10 000 Points',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.white,

                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // autogroupcvhdcco (KMTk1xPbixA4Fopd4zCvHD)
                      left: 40*fem,
                      top: 383*fem,
                      child: Container(
                        width: 307.17*fem,
                        height: 54*fem,
                        decoration: BoxDecoration (
                          color: const Color(0xff273085),
                          borderRadius: BorderRadius.circular(50*fem),
                        ),
                        child: const Center(
                          child: Text(
                            'Bon d’achat 50 DT...50 000 Points',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.white,

                            ),

                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // autogroupwrwzsod (KMTk7NQFAn9RpeGL5MWrwZ)
                      left: 40*fem,
                      top: 454*fem,
                      child: Container(
                        width: 307.17*fem,
                        height: 54*fem,
                        decoration: BoxDecoration (
                          color: const Color(0xff273085),
                          borderRadius: BorderRadius.circular(50*fem),
                        ),
                        child: const Center(
                          child:  Text(
                            'Bon d’achat 100 DT...100 000 Points',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.white,

                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // autogrouphammKfd (KMTkFT17hHpeNgxUd8haMm)
                      left: 40*fem,
                      top: 525*fem,
                      child: Container(
                        width: 307.17*fem,
                        height: 54*fem,
                        decoration: BoxDecoration (
                          color: const Color(0xff273085),
                          borderRadius: BorderRadius.circular(50*fem),
                        ),
                        child: const Center(
                          child: Text(
                            'Telephone...1 000 000 Points',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.white,

                            ),

                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // autogrouphuebNP1 (KMTj7Uu2wrZzTiJ5UCHUeB)
                      left: 24*fem,
                      top: 6*fem,
                      child: SizedBox(
                        width: 328*fem,
                        height: 60*fem,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // accrocheadol2GzB (200:301)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 157*fem, 0*fem),
                              width: 111*fem,
                              height: 44*fem,
                              child: Image.asset(
                                'assets/accroche-adol-2-nJs.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              // autogroupc9kkC79 (KMTjKJtfF1vviLXQZTc9kK)
                              width: 60*fem,
                              height: double.infinity,
                              child: Stack(
                                children: [
                                  const CircleAvatar(
                                    radius: 35, // Adjust the size of the circle avatar as needed

                                  ),
                                  Positioned(
                                    // rectangleTBV (200:300)
                                    left: 43*fem,
                                    top: 0*fem,
                                    child: Align(
                                      child: SizedBox(
                                        width: 14*fem,
                                        height: 14*fem,
                                        child: Container(
                                          decoration: BoxDecoration (
                                            borderRadius: BorderRadius.circular(24*fem),
                                            color: const Color(0xffa80008),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    // xe3 (200:302)
                                    left: 47*fem,
                                    top: 1*fem,
                                    child: Align(
                                      child: SizedBox(
                                        width: 6*fem,
                                        height: 13*fem,
                                        child: const Text(
                                          '1',

                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                // autogroupr6b1Tqh (KMTkNrxRx8aQBS61nZR6b1)
                width: double.infinity,
                height: 100*fem,
                child: Stack(
                  children: [


                    Positioned(
                      // group16nmV (200:294)
                      left: 150*fem,
                      top: 0*fem,
                      child: SizedBox(
                        width: 80*fem,
                        height: 99.11*fem,
                        child: Stack(
                          children: [
                            Positioned(
                              // rectangle14Vvo (200:295)
                              left: 0*fem,
                              top: 0*fem,
                              child: Align(
                                child: SizedBox(
                                  width: 78.58*fem,
                                  height: 62.96*fem,
                                  child: Image.asset(
                                    'assets/rectangle-14-hMy.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // rectangle15aBZ (200:296)
                              left: 31.2426757812*fem,
                              top: 40.2366943359*fem,
                              child: Align(
                                child: SizedBox(
                                  width: 31.48*fem,
                                  height: 28.88*fem,
                                  child: Image.asset(
                                    'assets/rectangle-15.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // rectangle16TWF (200:297)
                              left: 51.1242675781*fem,
                              top: 28.6390380859*fem,
                              child: Align(
                                child: SizedBox(
                                  width: 28.88*fem,
                                  height: 35.5*fem,
                                  child: Image.asset(
                                    'assets/rectangle-16-qtK.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}