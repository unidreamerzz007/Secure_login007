import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: LoginPage(),
      routes: {
        '/secureLogin': (context) => SecureLoginPage(),
        '/thirdPage': (context) => ThirdPage(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final String _validUsername = 'unidreamerzz';
  final String _validPassword = 'jackey';

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username == _validUsername && password == _validPassword) {
      Navigator.pushNamed(context, '/secureLogin');
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Invalid Credentials'),
            content: Text('Please enter a valid username and password.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Here'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://w.forfun.com/fetch/67/674d9f64c8a3c0110654ebdd1e037503.jpeg?h=600&r=0.5'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecureLoginPage extends StatefulWidget {
  @override
  _SecureLoginPageState createState() => _SecureLoginPageState();
}

class _SecureLoginPageState extends State<SecureLoginPage> {
  int _currentIndex = 0;

  final List<String> backgroundImageUrls = [
    'https://lh3.googleusercontent.com/g7tPQ3DwGH9NCTRlhpuZf25vwi2LgLjVRpuSF3PxX9Nuc7O4JornC3dAdIV2prGrOGl3i6lvRntfALrevOAVHoUeQtznM1h8eUMAdwo23eFTcM062dsotcCggWI-jSw9isXzwAoVQgKQ6X-ledTR9nUxtWWyUgnuh9pjoGJuvSBHCHQ3l3kk8s96BKbo3-WHe2OYGOyO085mqhlyPrZrksdMtjq2cPtAvw-MmSPtmGja7nmIkrxvqi64xrIW_TcEemckhXZGwsWAJDWl3Fciul7VeePDL9_qeW-cy8aaR1ByvE8fjRla4KzRWlmH_dqVkz72Bh5y-_XBexa57bDeHb9yyXKBtsLXQbS-ernn0_wzeTx9ZbxZEU7D8ctPUCpGEgrnj5EZwSxqRaFmkHRhvn7XVvE3fmB-oB4UWbSWSVOLihonL3u--rIO9dNVBegDs9Bse49tSXFfx-PLn1RLvxjjbngtWWfMLQ0tBDVWeRMK_gjFMfutP4WY0HtFzIicPWJW43oTwYTcPUTA4ablAP7PhM5k2tueLVVjoTAbX8PQYFsypxf9NMAIYDja5wfyFgJ_rPqGahqaaufFuQKUTRVeYqF69kb2gTrDRfKzcgj8H3wtU_SwQmSRvniAsOEvmpLdubqr5ijDixKe__UVSSnDstlBTTggwYzXv6THDsN4mWV-uqGkmMR3AK7j_5LVXQcqHnd8IF9e6gHyxK8l2Abgyy0d4d7da1JEB_IidrgMQiSutqp7de83xFYhINj4hY5eAteJ_z_ltDT6EE-Hsr_gHsFf_XZrXxLk_UzKtALfoCdpHoSu1Z99vfEbmyyLi2NRal0WiOLlaqU2EgeA2uuk6F0YGP9kk2mHpKYezaC1078PTtNDSe8KnvFvEh_eAFeXjM-xjQ8Ycy73AgFlxrNc6_z0EHc8IcrK1OMp69ZTcXvaQDbEVxQ1GTJn-JpZTPTkn9cRfCk8UBX1YtCmPEn7umxII2QAlr8Xp8vswGDqGnp5LA=w720-h720-s-no?authuser=0',
    'https://lh3.googleusercontent.com/AiXZkiCs6NTh_xeV7MGl9btEuAVp9nfDnfJ0elV_4zq8AaAeckXcMSm6hUWHavXy3EEoo7oDDPkbhc150IIkGkifTvMmO8CD-bpeALicasb4Nn1mWlTuY5yKoxqmeuPmuR7fzsVQbmTRw2190c47uVrm-6DyeCjMmKleDh5KSJ2yRjcHe1OryECj2Xukb911DPGJVmGy767NkmvLwUkvPi8zRUfD7UjGZh92cDH8XD2a3LpmZscVBGWyNSf10tKhq9B7VQ8H2iKqooc4g0vJbwWoZOm_9VFAhpAUklgETbnJgIvncA23Y0KTXGHjeVGYZ9eptJTJRBJ-Spz_a3AnVwIeAZUCPMOqPF_dJ7uHlSF9f7d8JJ_FLRSVzaChhL_0FgdH2L9l1ZkM0HHZa4pHYoqGpfHzvq2yShQoXymDqOauBRA6E06CKiH2NMBkgCy-HYVfWaRptlhGC7YYq0Dx5kuPch8MaDeHlvAQ9G7Ea56rFM7kJJ_adZylr36iUiR6VKOvvtS2hLdcSgoLY2qGEN4kZVZ7NcIFFiI4hTQ6WSzZFv88qAjCtoM5YR5Q3qLUvZ_dDfErdKCho48j6iFvwqQXaQ556P76Qjzx4MpIvsOTvfscN24dhrEbwtjcWqvKgjKB4s2TXN2WigIu2cbwjS9a0kfDcItrAoaz1j_gwH6EERK50-15uvgcBafkfldpU05yF9oM_Jr1mn191NBiX1PA96tK2nBppXKU-zGye-u0fAzdXuNxX6YjmpnayhhxwQSPye9imKhXheZNC4dGohZHFInK3bpOdusSD6fRQxIkaROKsnUcyw9Qe-_dNKcrF78WyMzNu4cNOGLPyZlou5weYdl35FeILxsamieeUi5jXyNioUM0OBo2TaHQdA9SdRNMWMa4cffIaaPPYDAno4CzcPQLVq28f5xEpQ_wniCdht0JhtPwxNbGpuUV8d6d5zT3hj28wVWAScg23Dkb6k4tFoILryGXUQpRQ7eBHZx9UPZrQA=w720-h720-s-no?authuser=0',
    'https://lh3.googleusercontent.com/mvTghhSp_IL6VA6PgliwGkALkJTMagjOz33bN7aWDiENNipzZoBnqZEFA82p_AKIEMGkUN7M6aKrww7qOteWnzIWLnTDLxzKLa1iKX2wXnMtZeRUs4yldpaeCQ6rmJh5M4f9Zn91gALh2mSW70ISOcRwykw3Hqic9zoki08LsgrlS5SczH1tP-1R7qZK6Jfr4bkOATm8B5yN7go3e5YgMIHTm-OqIbigpHst6J6q9YadfNld_hQkr9VXbvBOzvUyxcngvt6-Vx1XdNsBZv4BgJx_2oq2UI0o0gTSmRIAvRTSIgtwjuEW6oYEcvsGc2SALrTH9gMsPSMdDh14MjLaYGDek02XsrafMapkEnMBf2CVouUEddxdUhWqKpDG-0AgXBYmsvaKNW2KZQvB4Z0mltxDs02o92WDZUAw-SbhkZAB37bhxg0itZ6LAjfhhuot60oCPvEY5k1iDgow08M9Hl5r3U3JIfqnogKisC2JdRW46UNwEWNaqWV_2WLdGPZplI84IQUun2jb4NyWEYwjrW11z1K1yO0UDq65GEK-gbZNKPgycj_irkxI2eTy6RqBUSNc1pc4gaaapfi5-FuI2oOBVajfwJ_VmngETGrzEuNBDw3sJHDjL8Es0qdV4YLUax6iTmOnKJM58xLztqUPEj5Tx9h6TEafZbHg-3B8d2N--KcyZy2bK6TNtxD7RPy4b5vJBCZ3oH47YS1uBaygwon6IXc0OowTDG-4W8pe-lwWDhofn-PeLfMcgh9cWyf7teZ2NpzmqGQMXCbf-nb4m8UjUL51O34J3scnbVaG41dOlfZqsFuS-vEFu7jkZLlSr-6BkUe9I40ELFranfujonLD3JaML3r0z4doVwEwHynGsyjf-uo-Hy5Nh-nRyQHgSB8qGhsfCqOrTYrHe3gCpHyC9eJH373tV65pT2ebGHi4uccN2wPoGCLd9MPxjxxMinNxqzL_Sj5JWs3c8kAeVw3S9v19dnoTB4mfxD5XQG1O1_8c1w=w720-h900-s-no?authuser=0',
    'https://lh3.googleusercontent.com/QRZczEohP_ZDpPlzVXST5iX5gJVyZKeKVzbbiaRUEY3ggdZOfBS6w_GmuRH38wpWemYGzvF7BDtTtKXJrHVDhAZ9Zov6g2Y698tk1lsXl38NCGiYWr7Bio7gJMZzbBdnssHVoIDfsK_8ZEvvz8zUUu9Wqnwbr01IiPudNjAaRBMAiOib3ss1gVhdLydchicgikXsniXQ8ZlJnEr8mImX-Q7aa8yOUyH27ykxd2jMryFP2iqD20IhR2PzAn8NdEQSniatmODnZRzSIaUvEQQNB0P6bVmpSRl87S9eYxSU3NTRMPvpryUgcMi8F111TFA9sjde-tERUnXAUKvlvN_l2kUQGBSFaTd8n01izBysSpjJ_OA1F_cE4bKlQpRCRzKAC7pSkRiEs5qWGTBjZWQ08Q5D2OPV-HMCp6fE-YqJRJfCd7GWRNjPOXdgIVei-8L3Sn-wE5mIVqxCD4A2ryAQP-Ujcqio1AxuFGthNMiFwHPMuvQ2L0vaqxZUjOiRASpQK1x7hWolv454qSUL8q9RKaGOC1nF6-vkbTK0MHASY0Jzt-7u_XZgxJjecRCZrv7dymF5eJLWOR-1IKkOclEqbWZyRzCfZIiTT1yt6t88gdceZzXsbyZGxGRUP8RvHKEuqi5ZPFJe3uKate4IR8MOmJ7vs5elB0IP0ZkMami_KJYW-ZB6uCAIyI4shr-sEefxFWnvepqru_HVq2zjQsjhKqz7_nN2fRRmYVFrJM6P32iJv-dDWcyYV8v9Jwk9ABs5eGL4pSssheospcnDNrkP-Bzf6qxr-x9JKSPsAbcZq1yGyJTukf-1UrSpO2rZ3SmXkrD391BgMZNvTqTlpg2VaI4IZwuubwnN6WYleSb3uC_KzUnLfpMFXqAzu8IrSxcx8H8WKj1RHKmGnUPLN24g6S68yGUTBmMKU6dQNqwj6N8g3_jhLLrRwhukjDCufRyZfvIGfpFo3LdeGDh8Ylh_7lUcTyNxDj46xXd_QkLWzdjhvu9qMA=w720-h900-s-no?authuser=0',
    'https://lh3.googleusercontent.com/4_GnvmuVJTp_SG8-CsPvwNRFBZ41_z7n7x8MfPIEBPiyj7uXC0LVnfceyb1HR15jUmrsz3oPOhiXxaHyvG6SJG0lQgBMa-WhFjPN5YFnHVT_emJ_z6MktX9h_JALrutlx0Nov1p_dBoeQPNcsTLvGZI_sFqr_XAUfqFnp-qAN_sh1cjKe4t5BmpaYxPVaG2aYzJmo-_zSJPdMwvX0zbK4484BDULjgcDSGKGP4K-gUypNE2_z72eAY5SBfPAwRwPg4dfg8HUMt8wUY2fDqm1lIjXjRfB_4EP1Sy3RanUW5xcvwqBm4_SdwbebgG-Y1O5HIS2ut0Ia8_8FBkxH8vy07pnFqd6Y9C3y4x8cl2vEGX-JqVnn79F3eRxJMSKMq-SQOqRhcWNGbH3YXEDwWdLKZ7zDvPrPL3V9dYYwpdbg2Wr9sZzSw55JZXjUfDzdfUnOowUzObSejaRFXEXSHapgv9_aOnhnQT6RvidoyPsgnHHh1bsBRhZFRQZV6fY9eeV2wKl-sSXijBsHPWzljOPLehId57Vdim7cNFdzYwx1fzw4Hs7fwGwHyVL14S8PrAr3-SQgCYbHEz9wxiCDH9DOVjQIDW4C86rL8Z6EL6Izm592KQ2_4ixSfJV7hxNgtfe8JLVl4JZTSZd0buE1lOSqn0eXV9jdy-ZuhDYKM4OwULeNLAi6rTiU3Ebc1M1vtx8c42rUiF3sGUtmqU-yoEvE-OGycohic5K3A97IWbXuncEK5Q_36iHoRXGmaHEgmzro98CE1sGk-2NejShpuUXq9lNX-zRUZYTb8pOH-9tJdlUKDz6D6c2621KEDm8_PvkCWKOwxhB2xT80dTXPSbI2PdrtEok0s6fNeaw42eK1q8BYjb0B5DhTI7wFirk4Z4HC7KSvxF6RfAFOMDOsUR4M19lLmqRgS4R3bnP_13B946yK7zNtl4_xr8I7aOKJ6lJM6HCztPHn6EsXkMLPlvMts0ohBONIBvJxyV0OXRqg5hG6oCP7Q=w720-h720-s-no?authuser=0',
    'https://lh3.googleusercontent.com/M0K6vAqsKm8BevfVtO7yMAYYxMxB1j1CxDjBDmhJQOd2Ad3dXEioRZIcSaHtN0bfR7_qwpVvRSBRNO6vBHfBFq8uG9pQ9DadX0aAp3Z-rnOxTNaW6ebAPQFJrzJatTReAoibS7nKGDe1zfzUSJKVml3hWN2AGQo4ohPhFavY7QhlcVfhjYYa1RxNoOKqyRN9NamQ2ISqZdEgoEK-uhejKx0rOjMihQveEDx2nYBSPDoY4xB0wVrrYPpbBhNLgNSRYgwahKh2STpPO6cibwANO0uW-xfjw2RCi4r_GOJgIZz8_NDhQaYNtH1Osc737wJt5aMUBLZgFfPG-o2bsQng2sAsJjVq1LGGR5sq9iXsKNLe6zYqRBuFQj2fCf_MyYETwcCcl4IDZ0RYuxGbTuv0k0m2BhZwa1YyPh71w4UL9O0PJ2c3xAqRLdeowdotQ3WpNjCYa0g7o8YwnpN9eeUW6q4yyvMp3mB2YbQp2hFsfGN_Z8PdYGw8QY_LESBMrszgevbVjBvYDnXnm5vyQhMe7fIzYErXg0ibOQuIVVOwJr0I1FiFUZD3LCR97tgWsK24IzNLrYzJanAtYD2p7ETqOwyrGO9dfGwGQz1n1FhaC5r1q8Xjzd0HB1hu3YcEuCYnkkT8mqxZ3-rvoB0lOQ5KUZlm1XWshd8AzTQFA7NsNNpZvZulGPDzgefueSf_RYhWESP2F3WWU5zbzU7EpibthFWFn9txSlkssZcmeff4aDOtILVWwPmpxOaYO6cqv4xidVQMQh9X7ino9V8_58CLICLL-95dJpcTP1O2wTTOOQPGBdrzr8Ata4cq_ysd5R4y2H8Keb0B06qLHe-nMdXuGPIqft8GjajTsYIbnrrVgLl0Mj5jc2wvjdYcN9ICD0iNJXWuoXfEmzIabwiDEIoJvJhEH6rrswsOAA3YkgRaXXEx1g5voawnT2F2m3-X_jOwqXMsKSwZN3ndCl5LvLpTxtQv7fYfyJ1VzzY_jBKus9dpw_rjIA=w722-h962-s-no?authuser=0',
    // Add more image URLs for each page
  ];

  final List<String> animalNames = [
    'Gopal',
    'Adhi',
    'RN Vazha',
    'Rachana',
    'Devi',
    'Poppu',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Secure Login'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.indigo.shade800,
              Colors.black,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 280.0,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: List.generate(backgroundImageUrls.length, (index) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(backgroundImageUrls[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Handle button press
                            },
                            child: Text(
                              animalNames[index],
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
            ),
            SizedBox(height: 20),
            Text(
              'Page ${_currentIndex + 1} of ${backgroundImageUrls.length}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Likes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
        onTap: (int index) {
          if (index == 2) {
            Navigator.pushNamed(context, '/thirdPage');
          }
        },
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('La Toxica ShravanDAA'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://lh3.googleusercontent.com/tYJYnt5jlOf073t7GVVXrJ4iAH6Gt6ZPRlfME1dbK_MxCXxTO6RtyW17fJkhPpGdPCKfhk2lK_n5Odr9VoepljWPq-p8EhFiLlFM5nlDn-mtwDXwvKK1knZiEDpXIG_pdRPWe9GsGXsnBKEx7nEXcaMW9lowQ7BI-FrbWmSPK8IMoAetQYD4rRlW75l-cJjj8-flrF5jKDVQLgdRhfQ8Kt2wT4Eyv41jwXZkw3y76V6yASxQi3cOjCdb306Xnpt_IlE5P9wC3I1GgDeiFnbZrLjWNB7b0zzW23hmvsTswlHrGhCDm9hLmSTmYLno-lnXRmGiDE4bDGdFA8TFs3IH_d_XePWXGWjpMXS1k1XxBN0Nb5M-TjPrjkKl9H6mO82FT815y5qrvqai6_nfHfNuoFkazjmHdUCjrF8HSO6Cbnyadllm8X1Mx5uCpd3yY1DxAmfgy2xHLMQ56SyMqpF1d01136EykWakgR-a6IQTH-nx66o4NV57D7nqewnE-AbdFh5lGnkSdaEbmO8cFkG9tuaHtmaKkILpcsXmRksbrE3KOUIf4aHo-HvAZErxjuqq0FOwZdR6DQwPRue5KvotnMgY0MnuiR5M_YvRVMbSPesz45Q6mL67cXyIiFNoUP6VXBnIOCBNEXrluF0OQFFbvtBSD0z3MvV_nbSEDsbatq37gZvAayBmka268M9qS6FxSpzyDd5eIYFk_4yEeNHI6-eQhtAtGkCcI65nZNK0T5-zc0OrI2k3kpl_CYTdEFyRA54KojKvTOlezB1Lzsfg3bpW7ile2tgkfGYovazlNMUre88dEv-HzQcjrMQlsN-PRTrxPdKV6AbwQxnhFXNbhPea1Oemb2OSzavpShAUATHkcjlVorB2HlRJ5Ed8CmC9ZN6cqRYWXYY2ZbWOSoQKHAHDBu8NJCjAMPyuayvWe9uiezSl884Mo5vvj0_I4Vo0j2Ldp2SGjKswQOh18O1pX3CeIioPG3u42Wbmi5P1PKjsn22yCQ=w722-h962-s-no?authuser=0'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Welcome'),
                    content: Text('Welcome to the toxic world!'),
                    actions: <Widget>[
                      TextButton(
                        child: Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: Text('Do you know where you are..click here😈'),
          ),
        ),
      ),
    );
  }
}
