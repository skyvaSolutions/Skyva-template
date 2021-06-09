import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class BusinessWidget extends StatefulWidget {
  final name,address;


  const BusinessWidget({Key key, this.name, this.address}) : super(key: key);
  @override
  _BusinessWidgetState createState() => _BusinessWidgetState();
}

class _BusinessWidgetState extends State<BusinessWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 20,
        child: ClipPath(
          clipper: ShapeBorderClipper(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.24,
                child: Stack(
                  children: [
                    Image.network(
                      "https://4.imimg.com/data4/NL/MG/MY-14358752/2-pcs-copy-500x500.png",
                      height: MediaQuery.of(context).size.height * 0.20,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.11,
                      left: 20,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.11,
                        width: MediaQuery.of(context).size.width * 0.24,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.red),
                            borderRadius: BorderRadius.circular(100),
                            image: DecorationImage(
                                scale: 1,
                                image: NetworkImage("https://lh3.googleusercontent.com/proxy/XeYqOkWfqna2gTL2KA29pyDoaAhopNlgiesobr9G2TuOFGOihAQFm5LpE4ziec9gOFTE2UeTmfpb-cAL_ep2zeycad_xp3c"),
                                fit: BoxFit.scaleDown)),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.name,
                      style: GoogleFonts.poppins(
                          fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.address,
                      style: GoogleFonts.poppins(
                          fontSize: 15.2, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}