// Lejeune Hugo
// TPA
// Création d'un code qui quand il y à une erreur dans les coordonées il demande de réécrire les coordonées
public class ErreurCoordonneesException extends Exception
    {
        private int x;
        private int y;
        private String carac;

        public ErreurCoordonneesException(int x, int y, String carac)
            {
                this.x = x;
                this.y = y;
                this.carac = new String(carac);
            }

        @Override
        public String getMessage()
            {
                //getMessage pour 1, 3, 4 donc chaine de caractère vide x et y qui pose problème
                if (this.carac.equals(new String()) && (this.x > 0 | this.x < 7) && (this.y < 0 | this.y > 8))
                    {
                        System.out.println("Il y a une erreur sur le X veuiller le changer, il doit être compris entre 0 et 7 et doit contenir que des chiffres.");
                    }
                if (this.carac.equals(new String()) && (this.x < 0 | this.x > 7) && (this.y > 0 | this.y < 7))
                    {
                        System.out.println("Il y a une erreur sur le Y veuiller le changer, il doit être compris entre 0 et 7 et doit contenir que des chiffres.");
                    }
                if (this.carac.equals(new String()) && (this.x > 0 | this.x < 7) && (this.y > 0 | this.y < 7))
                    {
                        System.out.println("Il y a une erreur sur le Y et le X veuiller les changer , ils doit être compris entre 0 et 7 et doit contenir que des chiffres.");
                    }
                return this.x + this.y + this.carac;
            }
    }