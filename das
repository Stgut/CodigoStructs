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
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+++++++++++++++++++++++
++++++++++++++++++++++++++++
#include <stdio.h>
#include <stdlib.h>

struct NodoListaDoble{
    char dato;
    struct NodoListaDoble *ptrSiguiente;
    struct NodoListaDoble *ptrAnterior;

};

void enlistar (struct NodoListaDoble **ptrI, struct NodoListaDoble **ptrF);
int desenlistar (struct NodoListaDoble **ptrI, struct NodoListaDoble **ptrF);
void imprimeListaI(struct NodoListaDoble *ptrI);
void imprimeListaF(struct NodoListaDoble *ptrF);

int main(){
    struct NodoListaDoble *ptrInicial;
    struct NodoListaDoble *ptrFinal;
    ptrInicial = NULL;
    ptrFinal = NULL;
    char letra;
    int opcion=1;
    while (opcion != 0){
        printf("Ingresa la opcion deseada\n");
        printf("1.- Ingresar\n2.- Sacar\n3.- Imprimir por Inicio\n4.- Imprimir por Final\n0.- Salir\n");
        scanf("%d", &opcion);
        fflush(stdin);
        switch (opcion) {
            case 1:
                enlistar(&ptrInicial, &ptrFinal);
                //insertar(&ptrInicial);
                break;
                
            case 2:
                //letra = eliminar(&ptrInicial);
                letra = desenlistar(&ptrInicial, &ptrFinal);
                printf("El valor eliminado es %d\n", letra);
                break;
                
            case 3:
                imprimeListaI(ptrInicial);
                break;
                
            case 4:
                imprimeListaF(ptrFinal);
                break;
                
            default:
                break;
        }
    }
    return 0;
}
void enlistar (struct NodoListaDoble **ptrI, struct NodoListaDoble **ptrF){
    struct NodoListaDoble *ptrNuevo;
    struct NodoListaDoble *ptrActual;
    struct NodoListaDoble *ptrAnterior;
    char letra;
    printf("Que numero deseas enlistar \n");
    scanf("%s", &letra);
    fflush(stdin);
    ptrNuevo = (struct NodoListaDoble *)malloc(sizeof(struct NodoListaDoble));
    if (ptrNuevo != NULL){
        ptrNuevo->dato = letra;
        ptrNuevo->ptrSiguiente = NULL;
        ptrNuevo->ptrAnterior = NULL;
    }else{
        printf("No hay espacio en memoria\n");
        return;
    }
    ptrAnterior = NULL;
    ptrActual = *ptrI;
    while (ptrActual != NULL && letra > ptrActual->dato){
        ptrAnterior = ptrActual;
        ptrActual=ptrActual->ptrSiguiente;
    }
    if(ptrAnterior == NULL){
        ptrNuevo->ptrSiguiente = *ptrI;
        *ptrI=ptrNuevo;
        *ptrF=ptrNuevo;//nuevaLinea Agregada
    }else{
        ptrAnterior->ptrSiguiente = ptrNuevo;
        ptrNuevo->ptrAnterior = ptrAnterior;
        ptrNuevo->ptrSiguiente = ptrActual;
        if (ptrActual != NULL){
            ptrActual->ptrAnterior = ptrNuevo;
        }else{
             *ptrF = ptrNuevo;
        }
    }
}
int desenlistar (struct NodoListaDoble **ptrI, struct NodoListaDoble **ptrF){
    int letra;
    struct NodoListaDoble *ptrActual;
    struct NodoListaDoble *ptrAnterior;
    struct NodoListaDoble *ptrTemp;
    
    printf("Que numero deseas eliminar?\n");
    scanf(" %d", &letra);
    //eliminar el primer dato
    if (letra == (*ptrI)->dato) {
        ptrTemp = *ptrI;
        *ptrI = (*ptrI)->ptrSiguiente;
        if (*ptrI == NULL){
            *ptrF = NULL;
        }else{
            (*ptrI)->ptrAnterior = NULL;
        }
        free(ptrTemp);
        return letra;
    }
    
    ptrAnterior = *ptrI;
    ptrActual = (*ptrI)->ptrSiguiente;
    
    while (ptrActual != NULL && ptrActual -> dato != letra) {
        ptrAnterior = ptrActual;
        ptrActual = ptrActual->ptrSiguiente;
    }
    
    if (ptrActual != NULL){
        ptrTemp = ptrActual;
        ptrAnterior->ptrSiguiente = ptrActual->ptrSiguiente;
        ptrActual = ptrActual->ptrSiguiente;
        if (ptrActual == NULL){
            *ptrF = ptrAnterior;
        }else{
            ptrActual -> ptrAnterior = ptrAnterior;
        }
        free(ptrTemp);
        return letra;
    }
    return '\0';
}

void imprimeListaI(struct NodoListaDoble *ptrI){
    if (ptrI==NULL){
        printf("La lista esta vacia\n");
        return;
    }
    printf("La lista es: \n");
    while (ptrI != NULL) {
        printf("%s ===>", ptrI->dato);
        ptrI=ptrI->ptrSiguiente;
    }
    printf("NULL\n");
}
void imprimeListaF(struct NodoListaDoble *ptrF){
    if (ptrF==NULL){
        printf("La lista esta vacia\n");
        return;
    }
    printf("La lista es: \n");
    while (ptrF != NULL) {
        printf("%s ===>", ptrF->dato);
        ptrF=ptrF->ptrAnterior;
    }
    printf("NULL\n");
}
