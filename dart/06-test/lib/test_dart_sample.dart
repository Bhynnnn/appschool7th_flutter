const convertToKilometers = 1.60934;
const convertToMiles = 0.62137119;

class Travel {
  late double distance;
  Travel(this.distance);

  double distanceToMile() {
    return distance * convertToKilometers;
  }

  double distanceToKilomiters() {
    return distance * convertToKilometers;
  }
}
