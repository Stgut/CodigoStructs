#include <stdio.h>
#include <stdlib.h>
int i=0;
int op;
struct Santiago{
char descripcion[20];
int precio;
int inventario;
int pedido;
int producto;
};

struct Santiago ingresaProductos(); 
void imprimeProductos(struct Santiago productosImpreso);


int main(){

struct Santiago productos[3]; 

int opcion = 1;
    int i;
    while (opcion != 0){
        printf("BIENVENIDX A LA TIENDA SANTIAGO\n1
	1.- agregar producto\n
	2.- ver Producto\n");
        scanf ("%d", &opcion);
        fflush(stdin);
        switch (opcion) {
            case 1:
                printf("Seleccione uno de los siguientes productos:\n 
		1.-Memorias\n
		2.-Discos\n
		3.-Pantufleds");
                scanf("%d", &i);
                productos[i] = ingresaProductos();
                break;
            case 2:
                printf("Selecciona le producto que quieres ver\n
		1.-Memorias\n
		2.-Discos\n
		3.-Pantufleds");
                scanf("%d", &i);
                imprimeProductos(productos[i]);
                break;
                
            default:
                break;
        }
    }
}

struct Santiago ingresaProductos(){

}
for (i==0; i<3; i++ )

{

printf("Ingrese catalogo del producto %d:\t", i+1);
scanf("%d", &productos[i].producto);
printf("Ingrese el monto a llevar del producto %d:\t", i+1);
scanf("%d", &productos[i].inventario);
printf("Ingrese el precio del producto %d:\t", i+1);
scanf("%d", &productos[i].precio);
printf("Describa el producto %d:\n", i+1);
scanf("%s", &productos[i].descripcion);

}

printf("\n--------------------Recapitulando------------------------\n");

i=0;
for(i==0; i<3; i++)
{

printf("El catalago seleccionado del producto %d es: %d\n", i+1, productos[i].producto);
printf("El monto del producto %d es: %d\n", i+1, productos[i].inventario);
printf("El precio del producto %d es: %d\n", i+1, productos[i].precio);
printf("La descripcion del producto %d es: %s\n", i+1, productos[i].descripcion);

}
}
